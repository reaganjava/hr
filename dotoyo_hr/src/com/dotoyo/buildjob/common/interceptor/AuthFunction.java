package com.dotoyo.buildjob.common.interceptor;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;  
import java.lang.annotation.ElementType;
@Retention(RetentionPolicy.RUNTIME)//指定该注解是在运行期进行   
@Target({ElementType.METHOD})//指定该注解要在方法上使用  
public @interface AuthFunction {
  String functionCode() default "";  
}
