package com.niit.shoppingcart.exception;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.hql.internal.ast.QuerySyntaxException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javassist.tools.reflect.CannotCreateException;

@ControllerAdvice
public class VisionOnlineExceptions {
	
	@ExceptionHandler(SQLException.class)
	public ModelAndView handleSQLException(HttpServletRequest request, Exception e)
	{
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", "There is missing field or any table from the DataBase");
		mv.addObject("errorMessage", e.getMessage());
		return mv;
		
	}
	
	
	@ExceptionHandler(CannotCreateException.class)
	public ModelAndView handleCannotCreateException(HttpServletRequest request, Exception e)
	{
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", "Database Server is not Started");
		mv.addObject("errorMessage", e.getMessage());
		return mv;	
	}
	
	@ExceptionHandler(QuerySyntaxException.class)
	public ModelAndView handleQuerySyntaxException(HttpServletRequest request, Exception e)
	{
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", "One of the Query Syntax is not proper");
		mv.addObject("errorMessage", e.getMessage());
		return mv;	
	}	

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handleNoHandlerFoundException(HttpServletRequest request, Exception e)
	{
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", "There is no Handler Mapped to the Dispatcher Servlet for this request");
		mv.addObject("errorMessage", e.getMessage());
		return mv;	
	}
	
	@ExceptionHandler(ResourceNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView handleResourceNotFoundException(HttpServletRequest request, Exception e)
	{
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", "There is no Handler Mapped to the Dispatcher Servlet for this request");
		mv.addObject("errorMessage", e.getMessage());
		return mv;	
	}
	
	
}
