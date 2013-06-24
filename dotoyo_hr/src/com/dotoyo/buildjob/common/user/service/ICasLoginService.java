/**
 * 
 */
package com.dotoyo.buildjob.common.user.service;

/**
 * @author hdc
 *
 */
public interface ICasLoginService {
	
	public String getTicket(final String server, final String username, final String password,
			final String service);
	
	public String getServiceTicket(final String server, final String ticketGrantingTicket, final String service);
	
	public String getTicketGrantingTicket(final String server, final String username, final String password);
	
	public String ticketValidate(String serverValidate, String serviceTicket, String service);
	
	public void notNull(final Object object, final String message);
	
	public void warning(String msg);
	
	public void info(String msg);
	
	public void casLogout(final String server);

}
