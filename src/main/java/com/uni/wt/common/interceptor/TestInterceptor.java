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

	//API로그를 남기는 스프링 인터셉터라고 함.
	//https://catsbi.oopy.io/9ed2ec2b-b8f3-43f7-99fa-32f69f059171
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
