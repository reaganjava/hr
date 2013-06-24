package com.dotoyo.buildjob.common.exception;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-1
 * @description 系统自定义异常
 * 
 */
public class ServiceException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long errorCode;
	private int logId;
	private String msg;

	/**
	 * @return the errorCode
	 */
	public long getErrorCode() {
		return errorCode;
	}

	public int getLogId() {
		return logId;
	}

	/**
	 * @return msg
	 */
	public String getExpMessage() {
		return msg;
	}

	public ServiceException(long errorCode, String message, Throwable cause) {
		super(message, cause);
		this.errorCode = errorCode;
		this.msg = message;
	}

	public ServiceException(long errorCode, String message, int logId,
			Throwable cause) {
		super(message, cause);
		this.errorCode = errorCode;
		this.msg = message;
		this.logId = logId;
	}

	public ServiceException(long errorCode, String message) {
		super(message);
		this.errorCode = errorCode;
		this.msg = message;
	}

	public ServiceException(long errorCode, Throwable cause) {
		super(cause);
		this.errorCode = errorCode;
	}

	public ServiceException(long errorCode, String message, int logId) {
		super(message);
		this.errorCode = errorCode;
		this.msg = message;
		this.logId = logId;
	}

	public ServiceException(long errorCode) {
		super(String.valueOf(errorCode));
		this.errorCode = errorCode;
	}
}
