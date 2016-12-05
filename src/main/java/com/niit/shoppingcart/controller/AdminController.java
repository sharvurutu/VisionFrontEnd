package com.niit.shoppingcart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class AdminController {
	
	private static Logger log = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	Product product;

	@Autowired
	Category category;

	@Autowired
	Supplier supplier;

	@Autowired
	SupplierDAO supplierDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/manageCategories")
	public ModelAndView categories() {
		log.debug("Starting of the method categories");
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("category", category);
		mv.addObject("isAdminClickedCategories", "true");
		mv.addObject("categoryList", categoryDAO.list());
		log.debug("Ending of the method categories");
		return mv;
	}

	@RequestMapping("/manageProducts")
	public ModelAndView products() {
		log.debug("Starting of the method products");
		ModelAndView mv = new ModelAndView("/index");

		mv.addObject("isAdminClickedProducts", "true");
		mv.addObject("product", product);
		mv.addObject("productList", productDAO.list());
		mv.addObject("category", category);
		mv.addObject("categoryList", categoryDAO.list());
		mv.addObject("supplier", supplier);
		mv.addObject("supplierList", supplierDAO.list());

		log.debug("Ending of the method products");

		return mv;
	}

	@RequestMapping("/manageSuppliers")
	public ModelAndView suppliers() {
		log.debug("Starting of the method suppliers");
		ModelAndView mv = new ModelAndView("/index");
		mv.addObject("supplier", supplier);
		mv.addObject("isAdminClickedSuppliers", "true");
		mv.addObject("supplierList", supplierDAO.list());
		log.debug("Ending of the method suppliers");
		return mv;
	}

}
