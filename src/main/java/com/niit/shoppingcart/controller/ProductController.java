package com.niit.shoppingcart.controller;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.util.FileUtil;



@Controller
public class ProductController {
	
	public static Logger log = LoggerFactory.getLogger(ProductController.class.getName());
	
	@Autowired
	Category category;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Supplier supplier;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	Product product;
	
	@Autowired
	ProductDAO productDAO;
	
	private String path="resources/img/";


	/*@Autowired
	HttpServletRequest request;
	public String path = request.getSession().getServletContext().getRealPath("/");
	*/
	
	@RequestMapping("/UserSelectedProduct")
	public ModelAndView SelectedProduct(@RequestParam("pid")String ProductId)
		{
		log.debug("ProductController ---> Starting of the Method SelectedProduct()");
		
			System.out.println("Executing Selected Product Method");
			ModelAndView mv = new ModelAndView("home");
			product=productDAO.get(ProductId);
			mv.addObject("ProductId", ProductId);
			mv.addObject("Productname", product.getName());
			mv.addObject("product", product);
			mv.addObject("productlist", productDAO.list());
		    System.out.println(product.getName());	
		    mv.addObject("ShowSelectedProduct", "true");
		    
		    log.debug("ProductController --->Ending of the Method SelectedProduct()");
				return mv;
		}
	

/*	
	@RequestMapping("UserSelectedProduct/{product.id}")
	public String SelectedProduct(@PathVariable String productid)throws IOException
	{
		return "FZ";
	}
	
	*/
	
	
	
	
	
	@RequestMapping(value="/InsertProduct",method=RequestMethod.GET)
	public ModelAndView ShowInsertProduct()
	{
		log.debug("ProductController ---> Starting of the Method ShowInsertProduct()");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("product", new Product());
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("product", product);
		mv.addObject("productlist", productDAO.list());
		mv.addObject("userclickedInsertProduct","true");
		
		log.debug("ProductController ---> Ending of the Method ShowInsertProduct()");
		return mv;
	} 
	
	@RequestMapping(value="/ProcessInsertProductform",method=RequestMethod.POST)
	public ModelAndView ProcessInsertProductform(@ModelAttribute Product product,MultipartFile file)
	{
		log.debug("ProductController ---> Starting of the Method ProcessInsertProductform()");
		
		ModelAndView mv = new ModelAndView("home");
		System.out.println(product.getName());
		file=product.getImage();
		
		
		FileUtil.Upload(path, file, product.getId()+".jpg");

		productDAO.save(product);
		mv.addObject("product", product);
		mv.addObject("productlist", productDAO.list());
		mv.addObject("InsertProductSuccess", "Thank you Product Has Been Inserted !!");
		
		log.debug("ProductController ---> Ending of the Method ProcessInsertProductform()");
		return mv;
	}
	
	@RequestMapping(value="/DisplayAllProduct")
	public ModelAndView DisplayAllProduct()
	{
		log.debug("ProductController ---> Starting of the Method DisplayAllProduct()");
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("product", product);
		mv.addObject("productlist", productDAO.list());
		mv.addObject("ShowAllProduct", "true");
		
		log.debug("ProductController ---> Ending of the Method DisplayAllProduct()");
		return mv;
		
	}
	
	
	
	@RequestMapping(value="/ModifyProduct")
	public ModelAndView ShowModifyProduct(@RequestParam("pid")String ProductId)
	{
		log.debug("ProductController ---> Starting of the Method ShowModifyProduct()");
		
		ModelAndView mv = new ModelAndView("home");
		product=productDAO.get(ProductId);
		mv.addObject("product", product);
		mv.addObject("productlist", productDAO.list());
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
	mv.addObject("AdminClickedModifyProduct", "true");		
	
	log.debug("ProductController ---> Ending of the Method ShowModifyProduct()");
		return mv;
	}
	
	
	
	@RequestMapping(value="/ModifyProductform")	
	public ModelAndView ModifyProduct(@ModelAttribute Product product)
	{
		log.debug("ProductController ---> Starting of the Method ModifyProduct()");
		
		ModelAndView mv = new ModelAndView("home");
		productDAO.update(product);
		mv.addObject("product", product);
		mv.addObject("productlist", productDAO.list());
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("ModifyProductSuccess", "Thank you Product has been Modified !!");
		
		log.debug("ProductController ---> Ending of the Method ModifyProduct()");
		return mv;
	}
	
	
	@RequestMapping(value="/DeleteProduct")
	public ModelAndView DeleteProduct(@RequestParam("pid")String ProductId)
	{
		log.debug("ProductController ---> Starting of the Method DeleteProduct()");
		
		ModelAndView mv = new ModelAndView("home");
		product=productDAO.get(ProductId);
		productDAO.delete(product);
		mv.addObject("product", product);
		mv.addObject("productlist", productDAO.list());
		mv.addObject("category", category);
		mv.addObject("categorylist", categoryDAO.list());
		mv.addObject("supplier", supplier);
		mv.addObject("supplierlist", supplierDAO.list());
		mv.addObject("DeleteProductSuccess", "Thank you Product has been Deleted !!");	
		
		log.debug("ProductController ---> Ending of the Method DeleteProduct()");
		return mv;
	}
	
	
	
	
	
	
	

}
