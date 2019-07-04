package com.jeongchan.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component
@Aspect
@Log4j
public class LogAdvice {
	
	@Around("execution(* com.jeongchan.service.*Service*.*(..)) or execution(* com.jeongchan.controller.*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		
		long start = System.currentTimeMillis();
		
		Object result = proceedingJoinPoint.proceed();
		
		String type = proceedingJoinPoint.getSignature().getDeclaringTypeName();
		String name ="";
		
		if(type.contains("Service")) {
			name = "Service : ";
			
		}else if(type.contains("Controller")) {
			name = "Controller : ";
		}
		
		long end = System.currentTimeMillis();
		
		log.info(name + type + "."+proceedingJoinPoint.getSignature().getName()+"()");
		log.info("Argument/Parameter : " + Arrays.toString(proceedingJoinPoint.getArgs()));
		log.info("Running time : " + (end-start));
		log.info("-----------------------------------------------------------------");
		return result;
		
	}
}
