package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;


@Controller
public class CategoryController {
	public static Logger log = LoggerFactory.getLogger(CategoryController.class.getName());

	@Autowired
	Category category;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Product product;
	
	
	
	@RequestMapping(value="/InsertCategory",method=RequestMethod.GET)
	public String ShowInsertCategory(Model model){
		log.debug("CategoryController ---> Starting of the Method ShowInsertCategory()");
		
		model.addAttribute("userclickedInsertCategory","true");
		model.addAttribute("category", category);
		model.addAttribute("categorylist", categoryDAO.list());
		model.addAttribute("category", new Category());
		
		log.debug("CategoryController ---> Ending of the Method ShowInsertCategory()");
				return "home";
	}
	
	@RequestMapping(value="/InsertCategoryform")
	public ModelAndView ProcessInsertCategory(@ModelAttribute Category category)
	{
		log.debug("CategoryController ---> Starting of the Method ProcessInsertCategory()");
		
		ModelAndView mv = new ModelAndView("home");
		categoryDAO.save(category);
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("InsertCategorySuccess", "Category has been Successfully Inserted");
		
		log.debug("CategoryController ---> Ending of the Method ProcessInsertCategory()");
		return mv;
	}
	
	@RequestMapping(value="/DisplayAllCategory")
	public ModelAndView DisplayAllCategory(HttpSession session)
	{
		log.debug("CategoryController ---> Starting of the Method DisplayAllCategory()");
		
		ModelAndView mv = new ModelAndView("home");
	mv.addObject("category", category);
	mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("ShowingAllCategory", "show");
		
		log.debug("CategoryController ---> Ending of the Method DisplayAllCategory()");
		return mv;
	}
	
	@RequestMapping(value="/ModifyCategory")
	public ModelAndView ShowModifyCategory(@RequestParam("cid") String CategoryId){
		log.debug("CategoryController ---> Starting of the Method ShowModifyCategory()");
		
		ModelAndView mv = new ModelAndView("home");
		category =categoryDAO.get(CategoryId);
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("UserCLickedModifyCategory", "true");
		
		log.debug("CategoryController ---> Ending of the Method ShowModifyCategory()");
		return mv;
	}
	
	@RequestMapping(value="/ModifyCategoryform")	
	public ModelAndView ProcessModifyCategory(@ModelAttribute Category category)
	{
		log.debug("CategoryController ---> Starting of the Method ProcessModifyCategory()");
		
		ModelAndView mv = new ModelAndView("home");
		categoryDAO.update(category);
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("ModifyCategorySuccess", "Thank you Category has been Modified !!");
		
		log.debug("CategoryController ---> Ending of the Method ProcessModifyCategory()");
		return mv;
	}
	
	@RequestMapping(value="/DeleteCategory")
	public ModelAndView ProcessDeleteCategory(@RequestParam("cid") String CategoryId)
	{
		log.debug("CategoryController ---> Starting of the Method ProcessDeleteCategory()");
		
		ModelAndView mv = new ModelAndView("home");
		category = categoryDAO.get(CategoryId);
		categoryDAO.delete(category);
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("DeleteCategorySuccess", "Thank you Category has been Deleted !!");
		
		log.debug("CategoryController ---> Ending of the Method ProcessDeleteCategory()");
		return mv;
	}
	
	
	
}
