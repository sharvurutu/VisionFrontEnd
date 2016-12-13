package com.niit.shoppingcart.controller;

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

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ContactusDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Contactus;
import com.niit.shoppingcart.model.Product;




@Controller
public class HomeController {
	public static Logger log = LoggerFactory.getLogger(HomeController.class.getName());


	@Autowired
	Category category;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	Product product;

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	ContactusDAO contactusDAO;


	
	
	
	

	@RequestMapping(value = "/contactus",method = RequestMethod.GET)
	public String contactus(Model model) {
		log.debug("HomeController = Starting of the Method Contactus()");
		model.addAttribute("userclickedcontact", "true");
		model.addAttribute("contactus", new Contactus());
		log.debug("HomeController = Ending of the Method Contactus()");
		return "home";
	}
	
	@RequestMapping(value="/SubmitContactUsForm")
	public ModelAndView SubmitContactUsForm(@ModelAttribute Contactus contactus)
	{
		ModelAndView mv = new ModelAndView("home");
	contactusDAO.save(contactus);
		mv.addObject("ContactSubmitted", "Thankyou for Showing Interest on us. One of Our employee will definately contact you ");
		
		return mv;
	}
	
	
	@RequestMapping({"/","/home"})
	public ModelAndView index(HttpSession session) {
		log.debug("HomeController = Starting of the Method Index()");
		ModelAndView mv = new ModelAndView("/home");
		session.setAttribute("category", category);
		session.setAttribute("product", product);
		System.out.println(category.getProducts());
		session.setAttribute("categorylist", categoryDAO.list());
		mv.addObject("ShowCarousel", "true");
		System.out.println("Index method");
		log.debug("HomeController = Ending of the Method Index()");
		return mv;
	}

	
	@RequestMapping(value = "/aboutus")
	public String aboutus(Model model) {
		log.debug("HomeController = Starting of the Method Aboutus()");
		model.addAttribute("userclickedAbout", "true");
		
		log.debug("HomeController = Ending of the Method Aboutus()");
		return "home";
	}
	
	@RequestMapping(value="/accessdenied")
	public String accessDenied(Model model)
	{
		log.debug("HomeController = Starting of the Method accessDenied()");
		model.addAttribute("AccessDenied", "You Are not Authorized to Access this Page");
		model.addAttribute("accessdenied", "true");
		log.debug("HomeController = Ending of the Method accessDenied()");
		return "home";
	}
	
	
	
	
	}
