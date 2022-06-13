package com.uni.wt.common.interceptor;

import java.net.InetAddress;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.uni.wt.employee.model.dto.Employee;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	public static final String LOG_ID = "logId";

	//API로그를 남기는 스프링 인터셉터라고 함.
	//https://catsbi.oopy.io/9ed2ec2b-b8f3-43f7-99fa-32f69f059171
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();
        String uuid = UUID.randomUUID().toString();

        request.setAttribute(LOG_ID, uuid);

        //@RequestMapping: HandlerMethod가 넘어온다.
        //정적 리소스: ResourcehttpRequesthandler가 넘어온다.
        if (handler instanceof HandlerMethod) {
            HandlerMethod hm = (HandlerMethod) handler;
        }

        logger.info("REQUEST [{}][{}][{}]", uuid, requestURI, handler);
        return true;
	}
	
	 @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	        logger.info("pohstHandler [{}]", modelAndView);
	     /*   HttpSession session = request.getSession();
			Employee loginUser = (Employee) session.getAttribute("loginUser");//로그인 한 후 Session에 저장된 loginUser 객체 불러옴
			
			if(loginUser != null) {
				InetAddress local = InetAddress.getLocalHost();
				
				logger.info(loginUser.getId()+" "+local.getHostAddress());
			}*/
	        //@sessionattribute로 저장해서 request.getSession으로 값 불러올 수 없음
	        
	    }

	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	        String requestURI = request.getRequestURI();
	        String uuid = (String) request.getAttribute(LOG_ID);
	        logger.info("RESPONSE [{}][{}][{}]", uuid, requestURI, handler);

	        if (ex != null) {
	            logger.error("afterCompletion error:", ex);
	        }
	    }




	

}
