package com.uni.wt.common.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import ch.qos.logback.classic.Logger;

@Aspect
@Component
public class EnrollEmpAspect {
	private static final Logger logger=(Logger) LoggerFactory.getLogger(EnrollEmpAspect.class);
	
	@Pointcut("execution(* com.uni.wt..*ServiceImpl.*(..))")
	public void pointCut() {}
	
	
	
	public void beforeEnroll() {
		
		
	}

	

}