package com.niit.shoppingcart.util;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.model.BillingAddress;
import com.niit.shoppingcart.model.Order;
import com.niit.shoppingcart.model.PaymentMethod;
import com.niit.shoppingcart.model.ShippingAddress;



@Component
public class OrderWebFlow {
	final static Logger log = LoggerFactory.getLogger(OrderWebFlow.class);

	
	@Autowired
	Order order;
	
	

	public Order initFlow()
	
	{
		log.debug("WEBFLOW-->  Stating the Method initFlow()");
		Order order = new Order();
		/*order.setBillingAddress(billingAddress);
		order.setShippingAddress(shippingAddress);
*/		log.debug("WEBFLOW-->  Ending the Method initFlow()");
		return order;
	}
	
	public String addShippingAddress(Order order, ShippingAddress shippingAddress)
	{
		log.debug("WEBFLOW-->  Stating the Method addShippingAddress()");

		try{
			order.setShippingAddress(shippingAddress);
			String ss = shippingAddress.toString();
			order.setSa(ss);
			System.out.println(ss);
			
		}
		catch(Exception e)
		{
			log.debug("WEBFLOW-->  Ending the Method addShippingAddress()");

			e.printStackTrace();
			return "fail";
		}
		log.debug("WEBFLOW-->  Ending the Method addShippingAddress()");

		return "success";
	}
	
	public String addBillingAddress(Order order, BillingAddress billingAddress)
	{
		log.debug("WEBFLOW-->  Stating the Method addBillingAddress()");

		try{
			order.setBillingAddress(billingAddress);
			String ss1=billingAddress.toString();
			order.setBa(ss1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			log.debug("WEBFLOW-->  Ending the Method addBillingAddress()");

			return "fail";
		}
		log.debug("WEBFLOW-->  Ending the Method addBillingAddress()");

		return "success";
	}
	
	public String addPaymentMethod(Order order, PaymentMethod paymentMethod)
	{
		log.debug("WEBFLOW-->  Stating the Method addPaymentMethod()");
		try{
			order.setPaymentMethod(paymentMethod);
			String ss2 =paymentMethod.toString();
			order.setPm(ss2);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			log.debug("WEBFLOW-->  Ending the Method addPaymentMethod()");

			return "fail";
		}
		log.debug("WEBFLOW-->  Ending the Method addPaymentMethod()");

		return "success";
	}
	
	
	
	
}
