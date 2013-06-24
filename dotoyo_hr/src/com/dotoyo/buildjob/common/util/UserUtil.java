/**
 * 
 */
package com.dotoyo.buildjob.common.util;

import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import java.io.StringReader;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;


/**
 * @author hdc
 *
 */
public class UserUtil {
	
	/**
	 *	用户的Session标志
	 */
	public static String USER = "user";

	/**
	 *	已登录的用户
	 */
	public static Map<String, LoginUserInfoDto> loginUsers = new HashMap<String, LoginUserInfoDto>();
	
	public static String server="http://passport.jzpt.com/logout";

	/**
	 * 保存用户信息到Session
	 * @param user
	 */
	public static void saveUserToSession(HttpServletRequest request,LoginUserInfoDto user) {
		// 在session中保存当前会员实例
		request.getSession().setAttribute(USER, user);
		request.getSession().setAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO, user);
		
	}
	
	/**
	 * 获取当前登录的用户
	 * @return
	 */
	public static LoginUserInfoDto getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return getCurrentUser(session);
	}

	/**
	 * 获取当前登录的用户
	 * @param session
	 * @return
	 */
	public static LoginUserInfoDto getCurrentUser(HttpSession session) {
		Object sessionUser = session.getAttribute(USER);
		if (sessionUser == null) {
			return null;
		}
		LoginUserInfoDto User = (LoginUserInfoDto) sessionUser;
		return User;
	}


	/**
	 * 从session中移除用户
	 */
	public static void removeUserFromSession() {
		//移除单点登录用户
		ServletActionContext.getRequest().getSession().removeAttribute("_const_cas_assertion_");

		ServletActionContext.getRequest().getSession().removeAttribute(USER);
	}
	
	/**获取客户端IP*/
	public static String getClientIP(HttpServletRequest request){
		String ip = request.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	public static void casLogout(HttpServletRequest request) {
		final HttpClient client = new HttpClient();

		final PostMethod post = new PostMethod(server);
		
		try {
			client.executeMethod(post);
			removeUserFromSession();
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static String getServiceTicket(String server, String ticketGrantingTicket,
			String service) {
		if (ticketGrantingTicket == null)
			return null;

		final HttpClient client = new HttpClient();

		final PostMethod post = new PostMethod(server + "/" + ticketGrantingTicket);

		post.setRequestBody(new NameValuePair[] { new NameValuePair("service", service) });

		try {
			client.executeMethod(post);

			final String response = post.getResponseBodyAsString();

			switch (post.getStatusCode()) {
			case 200:
				return response;

			default:
				warning("Invalid response code (" + post.getStatusCode() + ") from CAS server!");
				info("Response (1k): " + response.substring(0, Math.min(1024, response.length())));
				break;
			}
		}

		catch (final IOException e) {
			warning(e.getMessage());
		}

		finally {
			post.releaseConnection();
		}

		return null;
	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#getTicket(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public static String getTicket(String server, String username, String password,
			String service) {
		notNull(server, "server must not be null");
		notNull(username, "username must not be null");
		notNull(password, "password must not be null");
		notNull(service, "service must not be null");

		return getServiceTicket(server, getTicketGrantingTicket(server, username, password), service);
	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#getTicketGrantingTicket(java.lang.String, java.lang.String, java.lang.String)
	 */
	public static String getTicketGrantingTicket(String server, String username,
			String password) {
		final HttpClient client = new HttpClient();

		final PostMethod post = new PostMethod(server);

		post.setRequestBody(new NameValuePair[] { new NameValuePair("username", username),
				new NameValuePair("password", password) });

		try {
			client.executeMethod(post);

			final String response = post.getResponseBodyAsString();
			info("TGT="+response);
			switch (post.getStatusCode()) {
			case 201: {
				final Matcher matcher = Pattern.compile(".*action=\".*/(.*?)\".*").matcher(response);

				if (matcher.matches())
					return matcher.group(1);

				warning("Successful ticket granting request, but no ticket found!");
				info("Response (1k): " + response.substring(0, Math.min(1024, response.length())));
				break;
			}

			default:
				warning("Invalid response code (" + post.getStatusCode() + ") from CAS server!");
				info("Response (1k): " + response.substring(0, Math.min(1024, response.length())));
				break;
			}
		}

		catch (final IOException e) {
			warning(e.getMessage());
		}

		finally {
			post.releaseConnection();
		}

		return null;
	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#info(java.lang.String)
	 */
	public static void info(String msg) {
		System.out.println(msg);

	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#notNull(java.lang.Object, java.lang.String)
	 */
	public static void notNull(Object object, String message) {
		if (object == null)
			throw new IllegalArgumentException(message);
	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#ticketValidate(java.lang.String, java.lang.String, java.lang.String)
	 */
	public static Map<String,Object> ticketValidate(String serverValidate, String serviceTicket,
			String service) {
		notNull(serviceTicket, "paramter 'serviceTicket' is not null");
		notNull(service, "paramter 'service' is not null");
		Map<String,Object> map =new HashMap<String, Object>();

		final HttpClient client = new HttpClient();
		GetMethod post = null;

		try {
			post = new GetMethod(serverValidate+"?"+"ticket="+serviceTicket+"&service="+URLEncoder.encode(service, "UTF-8"));
			client.executeMethod(post);

			final String response = post.getResponseBodyAsString();
			Document doc = parseXML(response);
	        
			NodeList nl = doc.getElementsByTagName("cas:attributes");
	         
	        for (int s = 0; s < nl.getLength(); s++)
	        {
	        	map.put("userid", ((Element)nl.item(s)).getElementsByTagName("cas:userid").item(0).getTextContent());
	        	map.put("username", ((Element)nl.item(s)).getElementsByTagName("cas:username").item(0).getTextContent());
	        	map.put("userAccount", ((Element)nl.item(s)).getElementsByTagName("cas:userAccount").item(0).getTextContent());
	           System.out.println(((Element)nl.item(s)).getElementsByTagName("cas:userid").item(0).getTextContent());
	        }
			//info(response);
			switch (post.getStatusCode()) {
				case 200: {
					info("成功取得用户数据");
				}
				default: {
	
				}
			}

		} catch (Exception e) {
			warning(e.getMessage());
		} finally {
			//释放资源
			post.releaseConnection();
		}
		return map;

	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#warning(java.lang.String)
	 */
	public static void warning(String msg) {
		System.out.println(msg);

	}
	
	private static Document parseXML(String contents) throws Exception
	{
	   DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	   DocumentBuilder db = dbf.newDocumentBuilder();
	   InputSource is = new InputSource();
	   is.setCharacterStream(new StringReader(contents));
	   Document doc = db.parse(is);
	   return doc;
	}

}
