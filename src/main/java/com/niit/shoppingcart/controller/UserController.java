package com.niit.shoppingcart.controller;

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

import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.User;



@Controller
public class UserController {
	
	public static Logger log = LoggerFactory.getLogger(UserController.class.getName());

	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	User user;
	
	@Autowired
	Login login;
	

	@RequestMapping(value = "/user-register", method = RequestMethod.GET) 
	public String Register(Model model,HttpSession session) { 
		log.debug("UserController ---> Starting of the Method Register()");

	    model.addAttribute("user", new User()); 
		model.addAttribute("userclickedRegister","true");
		
		log.debug("UserController ---> Ending of the Method Register()");
	    return "home"; 
	}

	@RequestMapping(value="/userform",method=RequestMethod.POST)
	public ModelAndView checklogin(@Valid @ModelAttribute User user, BindingResult result,HttpSession session)
	{
		log.debug("UserController ---> Starting of the Method checklogin()");
		ModelAndView mv = new ModelAndView("home");
		 mv.addObject("login", new Login()); 
		 
		 if(result.hasErrors())
			{
				mv.addObject("userclickedRegister","true");
				log.debug("UserController ---> Ending of the Method checklogin()");
				return mv;
			}
		 else{
		if(userDAO.get(user.getMail())==null)
		{
			user.setRole("ROLE_USER");
			userDAO.save(user);
			mv.addObject("UserRegisterSuccess", "true");
			mv.addObject("UserRegisterSuccessMessage", "Thank you! Please Login to Avail More Service !!");
			log.debug("UserController ---> Ending of the Method checklogin()");
			return mv;
		}
		else
		{
			mv.addObject("UserRegisterError", "true");
			mv.addObject("UserRegisterErrorMessage", "Your Email Id Already Exist in our Database!! Please Try with Different Email ID");
			log.debug("UserController ---> Ending of the Method checklogin()");
			return mv;
		}
		 }
	}
	
	@RequestMapping(value = "/cod") 
	public String Cod(Model model) { 
 
		model.addAttribute("ShowCODPage","true");
	    return "home"; 
	}
	
	@RequestMapping(value = "/credit_debit") 
	public String creditdebit(Model model) { 
 
		model.addAttribute("ShowDCPage","true");
	    return "home"; 
	}
	
	@RequestMapping(value = "/paypal") 
	public String paypal(Model model) { 
 
		model.addAttribute("ShowpaypalPage","true");
	    return "home"; 
	}
	
	
}

