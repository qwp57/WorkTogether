package com.uni.wt.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.uni.wt.employee.model.dto.Employee;

import ch.qos.logback.classic.Logger;

@Aspect
@Component
public class AfterLoginAspect {
	private static final Logger logger=(Logger) LoggerFactory.getLogger(AfterLoginAspect.class);

	
	@Pointcut(value="execution(* com.uni.wt..*ServiceImpl.login*(..))")
	public void pointCut() {}
	
	
	@AfterReturning(pointcut="pointCut()", returning="returnObj")
	public void afterLogin(JoinPoint join, Object returnObj) {
		if(returnObj instanceof Employee) {
			
			Employee e = (Employee)returnObj;
			
			if(e.getAdmin().equals("Y")) {
				logger.info("[LOG] : 관리자님 환영합니다.");
			}else {
				logger.info("[LOG] : "+e.getName()+"님 로그인 성공!!");
				
			}
			
		}
		
	}

	

}
