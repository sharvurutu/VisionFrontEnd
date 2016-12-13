package com.niit.shoppingcart.controller;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.User;



@Controller
public class LoginController {
	final static Logger log = LoggerFactory.getLogger(LoginController.class);

	
	@Autowired
	User user;
	
	@Autowired
	UserDAO userDAO;
	

	@Autowired
	Category category;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	Product product;

	@Autowired
	ProductDAO productDAO;



	@RequestMapping(value = "/showloginform", method = RequestMethod.GET) 
	public String showLoginForm(Model model,HttpSession session) { 
		log.debug("LoginController = Starting of the Method showLoginForm()");
	    model.addAttribute("login", new Login()); 
	    session.setAttribute("user", new Login());
		model.addAttribute("userclickedlogin","true");
		log.debug("LoginController = Ending of the Method showLoginForm()");
	    return "home"; 
	}
	
	@RequestMapping(value="/validate" ,method=RequestMethod.POST )
	public ModelAndView checklogin(HttpServletRequest request,HttpServletResponse res,HttpSession session,@Valid @ModelAttribute("login")Login login, BindingResult result)
	{
		log.debug("LoginController = Starting of the Method checklogin()");
		if(result.hasErrors())
		{
			ModelAndView mv = new ModelAndView("home");
			mv.addObject("userclickedlogin","true");
			log.debug("LoginController = Ending of the Method checklogin()");
			return mv;
		}
		else{
		ModelAndView mv = new ModelAndView("home");
	    mv.addObject("login", new Login()); 

	String name=request.getParameter("username");
	String pass=request.getParameter("password");
	user = userDAO.IsValidUser(name, pass);
	if(user!=null)
	{
		if(user.getRole().equals("ROLE_USER"))
		{
		String username =user.getName();
		String email = user.getMail();
		session.setAttribute("mail", email);
		session.setAttribute("name", username);
		mv.addObject("ShowCarousel", "True");
	session.setAttribute("UserLoginSuccessMessage", "Welcome");
	log.debug("LoginController = Ending of the Method checklogin()");

	return mv;
	}
		else
		{
			mv.addObject("IsAdmin", "true");
			boolean showadmin = true;
			session.setAttribute("ShowAdminForm", showadmin);
			mv.addObject("AdminSuccessMessage", "You are Logged in Admin");
			log.debug("LoginController = Ending of the Method checklogin()");

			return mv;
		}
}
	
	else
	{
		mv.addObject("UserLoginErrorMessage", "Invalid Credentials,., Please login again");
		log.debug("LoginController = Ending of the Method checklogin()");

	return mv;
	}	
	}
	
	}
	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session,HttpServletRequest request)
	{
		log.debug("LoginController = Starting of the Method logout()");
ModelAndView mv = new ModelAndView("home");
		session.invalidate();
		session=request.getSession(true);
		session.setAttribute("category", category);
		session.setAttribute("product", product);
		System.out.println(category.getProducts());
		session.setAttribute("categorylist", categoryDAO.list());
		mv.addObject("logOutMessage", "You are Successfully Logged Out");
		mv.addObject("logout", "true");
		log.debug("LoginController = Ending of the Method logout()");
	return mv;
	}
	
	
	
	}
	
	

