package com.niit.shoppingcart.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.model.User;

@Controller
public class HomeController {

	Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	User user;
	
	@Autowired
	Supplier supplier;
	
	@Autowired
	Cart cart;
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	SupplierDAO supplierDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	Category category;


@Autowired
private Product product;

@RequestMapping("/")
public ModelAndView onLoad(HttpSession session)
{
log.debug("Starting of the method onLoad");
 
ModelAndView mv = new ModelAndView("/index");
session.setAttribute("category", category);
session.setAttribute("product", product);
session.setAttribute("supplier", supplier);

session.setAttribute("categoryList", categoryDAO.list());
session.setAttribute("supplierList", supplierDAO.list());

log.debug("Ending of the method onLoad");
return mv;

}

@RequestMapping("/registerHere")
public ModelAndView registerHere()
{
	log.debug("Starting of the method registerHere");
	ModelAndView mv = new ModelAndView("/index");
	mv.addObject("user", user);
	mv.addObject("isUserClickedRegisterHere","true");
	log.debug("Ending of the method registerHere");
	return mv;
	
}

@RequestMapping("/loginHere")
public ModelAndView loginHere()
{
	log.debug("Starting of the method loginHere");
	System.out.println("loginHere");
	ModelAndView mv = new ModelAndView("/index");
	mv.addObject("user", user);
	mv.addObject("isUserClickedLoginHere","true");
	log.debug("Ending of the method loginHere");
	return mv;
	
}
}

