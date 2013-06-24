
package com.dotoyo.buildjob.common.servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;
/**
 * @author tyler.qu
 * @dateCreated 2010-11-26
 * @description 验证码生成
 */
public class ImageCaptchaServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private String captchaServiceName = "captchaService";
	
	public void init(ServletConfig servletConfig) throws ServletException {
		if (StringUtils.isNotBlank(servletConfig.getInitParameter("captchaService"))) {  
			captchaServiceName = servletConfig.getInitParameter("captchaService");  
		}  
		
		super.init(servletConfig);
	}

	protected void doGet(HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws ServletException,
			IOException {
		// 获取captcha服务对象
        ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());  
		Object bean = ctx.getBean(captchaServiceName);  
		ImageCaptchaService imageCaptchaService = (ImageCaptchaService) bean;  
		
		genernateCaptchaImage(httpServletRequest, httpServletResponse,imageCaptchaService);
	}
	
	private void genernateCaptchaImage(final HttpServletRequest request,
									   final HttpServletResponse response,
									   final ImageCaptchaService imageCaptchaService
									   )throws IOException {
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream();
		try {
			String captchaId = request.getSession(true).getId();
			System.out.println("******************验证码是: " + captchaId + "******************"); 
			BufferedImage challenge = (BufferedImage)  imageCaptchaService.getChallengeForID(captchaId, request.getLocale());
			ImageIO.write(challenge, "jpg", out);
			out.flush();
		} catch (CaptchaServiceException e) {
		} finally {
			out.close();
		}
	}

}