package com.dotoyo.buildjob.common.util;

import java.lang.reflect.Method;

import com.dotoyo.buildjob.common.interceptor.AuthFunction;

/**
 * function code  process
 * 
 * @author Bill xu
 * 
 */
public class ParseAuthNameUtil {
	
	public static String parseAuthentication(Class<?> clazz, String methodName) throws NoSuchMethodException {   
		        //根据方法名，取得方法，如果有则返回   
		        Method method = clazz.getMethod(methodName, null);   
		        if (null != method) {   
		        	AuthFunction authName = method.getAnnotation(AuthFunction.class);   
		            if (null != authName) {   
		                return authName.functionCode();   
		            }   
		        }   
		        return null;   
		    }   


}