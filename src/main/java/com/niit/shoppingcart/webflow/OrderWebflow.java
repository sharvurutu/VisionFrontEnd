package com.niit.shoppingcart.webflow;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.niit.shoppingcart.model.Order;
import com.niit.shoppingcart.model.Product;

public class OrderWebflow {
	@Autowired
	BillingAdreess billingAddress;
	
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
	
	public String addShippingAddress (Order order, ShippingAddress shippingAddress)
        {
			log.debug("WEBFLOW->-> starting of the method addShippingAddress");
			order.setShippingAddress(shippingAddress);
		
			log.debug("WEBFLOW->-> ending of the method addShippingAddress");
			return "success";
			
		}
	
	public String addBillingAddress (Order order, BillingAddress billingAddress)
    {
		log.debug("WEBFLOW->-> starting of the method addBillingAddress");
		order.setShippingAddress(billingAddress);
	
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
