package com.uni.wt.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.uni.wt.employee.model.dto.Employee;


public class TestInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(TestInterceptor.class);
	public static final String LOG_ID = "logId";


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 HttpSession session = request.getSession();
	        Employee loginEmp = (Employee) session.getAttribute("loginEmp");
	        logger.info("[TestIntercepter] : {}",loginEmp);
	        
	        if(loginEmp == null){
	            response.sendRedirect("/loginForm.do");
	            return false;
	        }
		
		
		return true;
		
	}
	
}
