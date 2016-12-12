/*package com.niit.shoppingcart.webflow;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.niit.shoppingcart.controller.UserController;
import com.niit.shoppingcart.model.Billingaddress;
import com.niit.shoppingcart.model.Order;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Shippingaddress;

public class OrderWebflow {
	
	public static Logger log = LoggerFactory.getLogger(OrderWebflow.class);
	
	
	@Autowired
	Billingaddress billingaddress;
	
	@Autowired
	Shippingaddress shippingaddress;
	
	@Autowired
	Order order;
	
	@Autowired
	HttpSession httpSession;

	@Autowired
	Product product;
	
	public Order initFlow()
	{
		log.debug("WEBFLOW->-> starting of the method initFlow");
		order = new Order();
		
		log.debug("WEBFLOW->-> ending of the method initFlow");
		return order;
	}
	
	public String addShippingAddress (Order order, Shippingaddress shippingaddress)
        {
			log.debug("WEBFLOW->-> starting of the method addShippingAddress");
			order.setShippingAddress(shippingaddress);
		
			log.debug("WEBFLOW->-> ending of the method addShippingAddress");
			return "success";
			
		}
	
	public String addBillingAddress (Order order, Billingaddress billingaddress)
    {
		log.debug("WEBFLOW->-> starting of the method addBillingAddress");
		order.setBillingaddress(billingaddress);
	
		log.debug("WEBFLOW->-> ending of the method addBillingAddress");
		return "success";
		
	}
	
	public String addPaymentMethod (Order order, PaymentMethod paymentMethod)
    {
		log.debug("WEBFLOW->-> starting of the method addPaymentMethod");
		order.setPaymentMethod(paymentmethod.getPaymentMethod());
		confirmOrder(order);
	
		log.debug("WEBFLOW->-> ending of the method addPaymentMethod");
		return "success";
		
	}
	
	
	
}
*/