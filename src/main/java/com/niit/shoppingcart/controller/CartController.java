package com.niit.shoppingcart.controller;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.MyCart;
import com.niit.shoppingcart.model.Product;

@Controller
public class CartController {
	private static Logger log = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private MyCart myCart;

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(value = "/myCart", method = RequestMethod.GET)
	public String myCart(Model model, HttpSession session) {
		log.debug("Starting of the method myCart");
		model.addAttribute("myCart", new MyCart());
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");

		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
		}
		int cartSize = cartDAO.list(loggedInUserid).size();

		if (cartSize == 0) {
			model.addAttribute("errorMessage", "You do not have any products is your myCart");
		} else {
			model.addAttribute("cartList", cartDAO.list(loggedInUserid));
			model.addAttribute("totalAmount", cartDAO.getTotalAmount(loggedInUserid));
			model.addAttribute("displayCart", "true");
		}
		log.debug("Ending of the method myCart");
		return "/index";
	}

	/*
	 * @RequestMapping(value = "/carts", method = RequestMethod.GET) public
	 * String listCarts(Model model) { model.addAttribute("cart", new Cart());
	 * model.addAttribute("cartList", this.cartDAO.list()); return "cart"; }
	 */

	// For add and update cart both
	@RequestMapping(value = "/myCart/add/{id}", method = RequestMethod.GET)
	public ModelAndView addToCart(@PathVariable("id") String id, HttpSession session) {
		log.debug("Starting of the method addToCart");
		Product product = productDAO.get(id);

		myCart.setPrice(product.getPrice());
		myCart.setProductName(product.getName());
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
		}
		myCart.setUserID(loggedInUserid);
		myCart.setStatus('N');// Status is New, Once it is dispatched, we can
								// changed to 'D'
		myCart.setId(ThreadLocalRandom.current().nextLong(100, 1000000 + 1));

		cartDAO.save(myCart);

		ModelAndView mv = new ModelAndView("redirect:/home");
		mv.addObject("successMessage", "Successfully add the product to myCart");
		log.debug("Ending of the method addToCart");
		return mv;

	}

	@RequestMapping("myCart/delete/{id}")
	public String removeCart(@PathVariable("id") String id, ModelMap model) throws Exception {
		log.debug("Starting of the method removeCart");
		try {
			cartDAO.delete(id);
			model.addAttribute("message", "Successfully removed");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		log.debug("Ending of the method removeCart");
		return "redirect:/index";
	}

	/*
	 * @RequestMapping("cart/edit/{id}") public String
	 * editCart(@PathVariable("id") int id, Model model) {
	 * System.out.println("editCart"); model.addAttribute("cart",
	 * this.cartDAO.get(id)); model.addAttribute("listCarts",
	 * this.cartDAO.list()); return "cart"; }
	 */
}
