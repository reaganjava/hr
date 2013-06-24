package com.dotoyo.buildjob.certificateCenter.action;

import com.dotoyo.buildjob.certificateCenter.service.ICertAccessHistoryService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public class CertAccessHistoryAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9084163972990574982L;
	private ICertAccessHistoryService certAccessHistoryService;

	/**
	 * @return the certAccessHistoryService
	 */
	public ICertAccessHistoryService getCertAccessHistoryService() {
		return certAccessHistoryService;
	}

	/**
	 * @param certAccessHistoryService
	 *            the certAccessHistoryService to set
	 */
	public void setCertAccessHistoryService(
			ICertAccessHistoryService certAccessHistoryService) {
		this.certAccessHistoryService = certAccessHistoryService;
	}

}
