/**
 * 
 */
package com.dotoyo.buildjob.common.user.service.impl;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.common.user.service.ICasLoginService;

/**
 * @author hdc
 *
 */
public class CasLoginServiceImpl implements ICasLoginService {

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#getServiceTicket(java.lang.String, java.lang.String, java.lang.String)
	 */
	public String getServiceTicket(String server, String ticketGrantingTicket,
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
	public String getTicket(String server, String username, String password,
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
	public String getTicketGrantingTicket(String server, String username,
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
	public void info(String msg) {
		System.out.println(msg);

	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#notNull(java.lang.Object, java.lang.String)
	 */
	public void notNull(Object object, String message) {
		if (object == null)
			throw new IllegalArgumentException(message);
	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#ticketValidate(java.lang.String, java.lang.String, java.lang.String)
	 */
	public String ticketValidate(String serverValidate, String serviceTicket,
			String service) {
		notNull(serviceTicket, "paramter 'serviceTicket' is not null");
		notNull(service, "paramter 'service' is not null");
		String rtstr="fail";

		final HttpClient client = new HttpClient();
		GetMethod post = null;

		try {
			post = new GetMethod(serverValidate+"?"+"ticket="+serviceTicket+"&service="+URLEncoder.encode(service, "UTF-8"));
			client.executeMethod(post);

			final String response = post.getResponseBodyAsString();
			//info(response);
			switch (post.getStatusCode()) {
				case 200: {
					info("成功取得用户数据");
					rtstr ="200";
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
		return rtstr;

	}

	/* (non-Javadoc)
	 * @see com.dotoyo.buildjob.common.user.service.ICasLoginService#warning(java.lang.String)
	 */
	public void warning(String msg) {
		System.out.println(msg);

	}

	public void casLogout(String server) {
		final HttpClient client = new HttpClient();

		final PostMethod post = new PostMethod(server);
		
		try {
			ServletActionContext.getRequest().getSession().removeAttribute("_const_cas_assertion_");
			client.executeMethod(post);
			
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
