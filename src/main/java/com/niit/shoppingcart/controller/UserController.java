package com.niit.shoppingcart.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.model.User;


@Controller
public class UserController {
	
	Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	User user;
	
	@Autowired
	Supplier supplier;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	Category category;
	
	@Autowired
	Cart cart;

	@Autowired
	CartDAO cartDAO;
	

	@RequestMapping(value = "/validate",method = RequestMethod.POST )
	public ModelAndView login(@RequestParam(value = "username") String userID,
	@RequestParam(value= "password") String password, HttpSession session)
{
	log.debug("Starting of the method login");
	
	ModelAndView mv= new ModelAndView("/index");
	user=userDAO.isValidUser(userID, userID);
	
	//if the record exist with this userID and password it will return user details else will return null
	
	if(user !=null)
	{
		log.debug("Valid Credentials");
		user = userDAO.get(userID);
		session.setAttribute("loggedInUser", user.getName());
		session.setAttribute("loggedInUser ID", user.getId());
		
		session.setAttribute("user", user);
		
		if(user.getRole().equals("ROLE_ADMIN"))
		{
			log.debug("Logged in as Admin");
			mv.addObject("isAdmin","true");
			session.setAttribute("supplier", supplier);
			session.setAttribute("supplierList", supplierDAO.list());
			
			session.setAttribute("category", category);
			session.setAttribute("categoryList", categoryDAO.list());
			
			
			
		}
		else
		{
			log.debug("Logged in as User");
			mv.addObject("isAdmin","false");
			cart=cartDAO.get(userID);
			mv.addObject("cart",cart);
			//Fetch the cart list based on userID
			 List<cart> cartList = cartDAO.list(userID);
			 mv.addObject("cartList",cartList);
			 mv.addObject("cartSize",cartList.size());
			 
			
		}
	}
	
	else
	{
	log.debug("Invalid Credentials");
	mv.addObject("invalidCredentials", "true");
	mv.addObject("errorMessage", "Invalid Credentials");
	}
	log.debug("Ending of the method login");
	return mv;
	}
	
	@RequestMapping("/logout")
	
		public ModelAndView logout(HttpServletRequest request)
		{
			log.debug("Starting of the method logout");
			ModelAndView mv= new ModelAndView("/index");
			session.invalidate();
			session = request.getSession(true);
			session.setAttribute("category",category);
			session.setAttribute("categoryList", categoryDAO.list());
			
			mv.addObject("logoutMessage", "You are successfully logged out");
			mv.addObject("loggedOut", "true");
			log.debug("Ending of the method logout");
			return mv;
					
			
		}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User user)
	{
		log.debug("Starting of the method registerUser");
		ModelAndView mv= new ModelAndView("/index");
		if(userDAO.get(user.getId()) == null)
		{
			user.setRole("ROLE_USER");
			userDAO.saveOrUpadate(user);
			log.debug("You are successfully register");
			mv.addObject("successMessage", "You are successfully registered");
			
		}
		else
		{
			log.debug("User exist with this id");
			mv.addObject("errorMessage", "User exist with this id");
			
		}
		
		log.debug("Ending of the method registerUser");
		return mv;
	}
	
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Model model)
	{
		log.debug("Starting of the method loginError");
		model.addAttribute("errorMessage", "Login Error");
		log.debug("Ending of the method loginError");
		return "index";
		
	}
	
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Model model)
	{
	log.debug("Starting of the method accessDenied");
	model.addAttribute("errorMessage","you are not authorized to access this page");
	log.debug("Ending of the method loginError");
		return "index";
		
	}
}

	
