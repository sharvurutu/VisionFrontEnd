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

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;



@Controller
public class SupplierController {
	public static Logger log = LoggerFactory.getLogger(SupplierController.class.getName());

	@Autowired
	Supplier supplier;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	
	
	@RequestMapping(value="/InsertSupplier",method=RequestMethod.GET)
	public String ShowInsertSupplier(Model model)
	{
		log.debug("SupplierController ---> Starting of the Method ShowInsertSupplier()");

		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierlist", supplierDAO.list());
	model.addAttribute("UserClickedInsertSupplier", "true");
	
	log.debug("SupplierController ---> Ending of the Method ShowInsertSupplier()");
	return "home";
		
	}
	
	
	@RequestMapping(value="/InsertSupplierform",method=RequestMethod.POST)
	public ModelAndView ProcessInsertSupplier(@ModelAttribute Supplier supplier)
	{
		log.debug("SupplierController ---> Starting of the Method ProcessInsertSupplier()");

		ModelAndView mv = new ModelAndView("home");
		/*supplier.setId(req.getParameter("SupId"));
		supplier.setName(req.getParameter("SupName"));
		supplier.setDescription(req.getParameter("SupAdd")) ;*/
		supplierDAO.save(supplier);
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("InsertSupplierSuccess", "Supplier has been SuccessFully Inserted");
		
		log.debug("SupplierController ---> Ending of the Method ProcessInsertSupplier()");
		return mv;
	}
	
	
	@RequestMapping(value="/DisplayAllSupplier")
	public ModelAndView ProcessDisplayAllCategory(HttpSession session)
	{
		log.debug("SupplierController ---> Starting of the Method ProcessDisplayAllCategory()");

		ModelAndView mv = new ModelAndView("home");
		/*session.setAttribute("supplier", supplier);
	session.setAttribute("supplierlist", supplierDAO.list());*/
	mv.addObject("supplier", supplier);
	mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("ShowingAllSupplier", "show");
		
		log.debug("SupplierController ---> Ending of the Method ProcessDisplayAllCategory()");
		return mv;
	}
	
	@RequestMapping(value="/ModifySupplier")
	public ModelAndView ShowModifSupplier(@RequestParam("sid")String SupplierId)
	{
		log.debug("SupplierController ---> Starting of the Method ShowModifSupplier()");

		ModelAndView mv = new ModelAndView("home");
		supplier = supplierDAO.get(SupplierId);
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("AdminClickedModifySupplier", "true");

		log.debug("SupplierController ---> Ending of the Method ShowModifSupplier()");
		return mv;
	}
	
	@RequestMapping(value="/ModifySupplierform")
	public ModelAndView ProcessModifySupplierForm(@ModelAttribute Supplier supplier)
	{
		log.debug("SupplierController ---> Starting of the Method ProcessModifySupplierForm()");

		ModelAndView mv = new ModelAndView("home");
		supplierDAO.udpate(supplier);
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("ModifySupplierSuccess", "Thank you Supplier has been Modified !!");
		
		log.debug("SupplierController ---> Ending of the Method ProcessModifySupplierForm()");
		return mv;
	}
	
	
	
	@RequestMapping(value="/DeleteSupplier")
	public ModelAndView ProcessDeleteCategory(@RequestParam("sid") String SupplierId)
	{
		log.debug("SupplierController ---> Starting of the Method ProcessDeleteCategory()");

		ModelAndView mv = new ModelAndView("home");
		supplier = supplierDAO.get(SupplierId);
		supplierDAO.delete(supplier);
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("DeleteSupplierSuccess", "Thank you Supplier has been Deleted !!");
		
		log.debug("SupplierController ---> Ending of the Method ProcessDeleteCategory()");
		return mv;
	}
	
	
}
