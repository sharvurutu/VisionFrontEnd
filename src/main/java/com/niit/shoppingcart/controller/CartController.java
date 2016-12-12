package com.niit.shoppingcart.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.hibernate.type.descriptor.java.CalendarDateTypeDescriptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Product;


@Controller
public class CartController {

	public static Logger log = LoggerFactory.getLogger(CartController.class.getName());

	@Autowired
	Cart cart;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	Product product;

	@Autowired
	ProductDAO productDAO;

	@RequestMapping(value = "/mycart")
	public ModelAndView DisplayAllCart(HttpSession session) {
		log.debug("CartController ---> Starting of the Method DisplayAllCart()");

		ModelAndView mv = new ModelAndView("home");
		String userid = (String) session.getAttribute("email");
		// List<Cart> cart = cartDAO.list(userid);
		System.out.println(userid);
		mv.addObject("cart", cart);
		mv.addObject("cartlist", cartDAO.list(userid));
		mv.addObject("TotalAmount", cartDAO.get_TotalAmount(userid));
		mv.addObject("ShowingAllCart", "show");

		log.debug("CartController --->Ending of the Method DisplayAllCart()");
		return mv;

	}

	@RequestMapping(value = "/AddToCart", method = RequestMethod.GET)
	public String AddtoCart(@RequestParam("pid") String Id, HttpSession session, Model model) {
		log.debug("CartController ---> Starting of the Method AddtoCart()");
		String userloggedin = (String) session.getAttribute("email");
		if (userloggedin == null) {
			/*
			 * Authentication auth =
			 * SecurityContextHolder.getContext().getAuthentication();
			 * userloggedin=auth.getName();
			 */
			
			log.debug("CartController --->Ending of the Method AddtoCart()");
			return "redirect:/showloginform";
		}
		System.out.println(Id);
		Product product = productDAO.get(Id);
		String email = (String) session.getAttribute("email");
		cart.setUser_Id(userloggedin);
		cart.setStatus('N');
		cart.setQuantity(1);
		cart.setId(cartDAO.getMaxId());
		cart.setProduct_Name(product.getName());
		cartDAO.Save(cart);
		model.addAttribute("CartAddedSuccessMessage", "Thank you! Product Has Been Added to Cart");
		
		log.debug("CartController --->Ending of the Method AddtoCart()");
		return "redirect:/mycart";
	}

	@RequestMapping(value = "/DeleteCart", method = RequestMethod.GET)
	public String DeleteCart(@RequestParam("cid") Integer Id, HttpSession session, Model model) {
		log.debug("CartController ---> Starting of the Method DeleteCart()");
		
		cart= cartDAO.get(Id);
		cartDAO.deleteByCartId(cart);
		model.addAttribute("CartDeletedSuccessMessage", "Thank you! Product Has Been Deleted from CArt");
		
		log.debug("CartController --->Ending of the Method DeleteCart()");
		return "redirect:/mycart";

		/*
		 * return mv;
		 */

	}
}