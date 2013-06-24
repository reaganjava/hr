package com.dotoyo.buildjob.common.constant;

public class Constants {
	// ********************************System increment
	// begin*******************************************//
	public static final String SYS_INCREMENT_TALENTS_SEARCH_FIELD = "016";
	public static final String SYS_INCREMENT_ADVERSITING_SEARCH_POSITION = "017";
	public static final int SYS_INCREMENT_COMMENT_SIZE = 10;// 页面显示个数
	public static final String RTN_SYS_MAIN = "main";
	public static final String RTN_SYS_EDIT = "edit";
	public static final String RTN_SYS_ADD = "add";
	public static final String RTN_SYS_ASSIGN = "assign";
	public static final String RTN_SYS_ASSIGN_FUNCTIONS = "assign functions";
	public static final String RTN_SYS_VIEW = "view";
	/** java mail **/
	public final static String JAVA_MAIL_HOST = "java.jmail.host";
	public final static String JAVA_MAIL_NAME = "java.jmail.username";
	public final static String JAVA_MAIL_PASSWORD = "java.jmail.password";
	public final static String JAVA_MAIL_FROM = "java.jmail.from";
	public final static String JAVA_MAIL_TITLE = "java.jmail.title";

	/** session user **/
	public final static String SESSION_USER = "loginUser";
	public final static String SYS_LOG_STATUS_LOGIN = "登录";
	public final static String SYS_LOG_STATUS_LOGINOUT = "退出";
	/** upload **/
	public final static int UPLOAD_BUFFER_SIZE = 1024;
	public final static String UPLOAD_ADVERT_DIRECTORY = "advert";
	/** 广告状态 **/
	public final static String ADVERT_STATUS_OPEN = "1";
	public final static String ADVERT_STATUS_STOP = "0";
	/** 广告类型 **/
	public final static String ADVERT_TYPE_IMAGE = "0";
	public final static String ADVERT_TYPE_WORD = "1";
	public final static String ADVERT_TYPE_FLASH = "2";
	public final static String ADVERT_TYPE_IMAGE_TITLE = "图片";
	public final static String ADVERT_TYPE_WORD_TITLE = "文字";
	public final static String ADVERT_TYPE_FLASH_TITLE = "flash";

	// ********************************System increment
	// end*******************************************//
	/** 管理员默认用户-配置文件key 具体指见 applicationProperties.properties **/
	public final static String SYSTEM_ADMINISTRATORS_DEFAULTNAME = "system.administrators.defaultname";
	public final static String SYSTEM_ADMINISTRATORS_ADDDEFAULT_PWD = "system.administrators.added.password";

	public final static int CERTNEEDS_LIST_SIZE = 10;// 证书需求列表大小
	public final static int PERSONALCERT_LIST_SIZE = 10;// 个人证书列表大小
	public final static int APPLYJOB_LIST_SIZE = 10;// 求职列表大小
	public final static int APPLICATION_JOBRECORD_List_SIZE = 10;// 职位申请记录列表大小
	public final static String INTERVIEW_SUCCESS = "1";// 面试通过
	public final static int TALENT_LIST_SIZE = 10;// 人才列表大小
	public final static int OFFLINESEARCHRESULT_LIST_SIZE = 10;// 线下人才搜索搜索记录列表大小
	
	public final static String SESSION_FUNCTION_NAME = "sessionFunctionName";// 功能点名称(Session)
}
