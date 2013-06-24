package com.dotoyo.buildjob.common.constant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-1
 * @description 应用常量类
 *
 */
public class ApplicationConstant {

	// 验证码接收参数KEY
	public static final String REQUEST_PARAMETER_CAPTCHA = "captcha";
	// toString 对象转换错误提示信息
	public static final String ERROR_CONVERTING_OBJECT_TO_STRING = "Error converting object to String";

	public static final int LIST_VIEW_SIZE = 10;

	public static final String COMMON_Y_EN = "Y";
	public static final String COMMON_N_EN = "N";
	public static final String COMMON_Y_CN = "是";
	public static final String COMMON_N_CN = "否";
	public static final String COMMON_UNLOGON = "UNLOGON";// 未登陆
	public static final String COMMON_USER_TYPE_ERROR = "userTypeError";// 用户类型错误

	public static final int SHORT_MSG_LIST_SIZE = 10;// 站内信列表大小

	public static final String USER_TYPE_PERSONAL = "0";
	public static final String USER_TYPE_ENTERPRISE = "1";
	public static final String SESSION_PARAMETER_USER_INFO = "userInfoDto";
	// “-”分隔符，基础数据用到了。
	public static final String SEPARATOR_DASH = "-";
	// "1001" 基础数据二级数据
	public static final String BASIC_DATA_CODE = "1001";
	// 人才中心首页顾问、全职、兼职列表大小
	public static final int APPLYJOBCTR_LIST_MAX_RESULT = 8;
	// 人才中心YES英文标识字符
	public static final String APPLYJOBCTR_YES_EN = "Y";
	// 人才中心NO英文标识字符
	public static final String APPLYJOBCTR_NO_EN = "N";
	// 人才中心YES中文标识字符（页面展示）
	public static final String APPLYJOBCTR_YES_CN = "是";
	// 人才中心NO中文标识字符（页面展示）
	public static final String APPLYJOBCTR_NO_CN = "否";
	public static final int APPLYJOBCTR_PAGE_SIZE = 10;
	// 求职信息状态-发布
	public static final String APPLYJOBCTR_ACTSTATUS_ACTIVE = "A";
	public static final String APPLYJOBCTR_ACTSTATUS_INACTIVE = "I";

	// 通知信息状态：0：未读、1：已读
	public static final String NOTICE_UNREAD = "0";
	public static final String NOTICE_READ = "1";

	// 猎证中心最新证书列表大小
	public static final int CERTCTR_LATESTCERTLIST_MAX_RESULT = 8;
	// 猎证中心最新需求列表大小
	public static final int CERTCTR_LATESTNEEDSLIST_MAX_RESULT = 8;
	// 猎证中心急需证书列表大小
	public static final int CERTCTR_NEEDSINDEEDLIST_MAX_RESULT = 8;
	public static final int CERTCTR_PAGE_SIZE = 10;
	// 状态0-未挂靠、状态1-已挂靠、状态2-暂停挂靠
	public static final String PERSONAL_CERT_NOT_ATTACHED = "0";
	public static final String PERSONAL_CERT_ATTACHED = "1";
	public static final String PERSONAL_CERT_PAUSED = "2";

	// 行业
	public static final String INDUSTRY = "001";
	// 职能
	public static final String COMPETENCY = "002";
	// 工程专业顾问
	public static final String ENGINEERING_CONSULTANTS = "001-1001";
	// 工程专项施工
	public static final String SPECIAL_CONSTRUCTION_WORKS = "001-1002";
	// 工程外围服务
	public static final String EXTERNAL_SERVICE_PROJECT = "001-1003";
	// 工程科学研究
	public static final String ENGINEERING_RESEARCH = "001-1004";

	// 专业类型code=003-
	public static final String SPECIALIZE_TYPE = "003";
	// 工作性质代码
	public static final String JOB_NATURE = "005";
	// 月 薪
	public static final String SALARY = "013";
	// 学历要求
	public static final String EDUCATION = "007";
	// 工作年限
	public static final String WORKINGLIFE = "006";
	// 语言能力
	public static final String LANG_CAPA = "008";
	// 掌握程度
	public static final String MASTERY = "009";
	// 计算机等级
	public static final String COMPUTER_GRADE = "011";
	// 证书类型
	public static final String CERT_TYPE = "004";
	// 证书注册状况
	public static final String REGISTER_STATUS = "012";
	// 执业证书
	public static final String ZHIYE_CERT = "004-1001";
	// 职称证书
	public static final String ZHICHENG_CERT = "004-1002";
	// 单位规模
	public static final String COMPANY_SIZE = "014";
	// 年龄基础数据
	public static final String BASIS_AGE_DATA = "019";

	// 职能分类职位
	public static final String FUNCTIONAL_CLASSIFICATIO_BUILDER = "002-1018";// 工长/施工员
	public static final String FUNCTIONAL_CLASSIFICATIO_DATA_PROCESSOR = "002-1032";// 资料员/档案管理员
	public static final String FUNCTIONAL_CLASSIFICATIO_MATERIALMAN = "002-1034";// 材料员/采购员/物资管理
	public static final String FUNCTIONAL_CLASSIFICATIO_SAFETY_MAN = "002-1020";// 安全/质检员/安全质量工程师

	public static final String FUNCTIONAL_CLASSIFICATIO_PLOT_OBSERVER = "002-1031";// 测量/测绘员/测量/测绘员
	public static final String FUNCTIONAL_CLASSIFICATIO_BUDGETING_SPECIALIST = "002-1017";// 造价工程师/预算员/成本控制

	// 全职
	public static final String FULL_TIME_WORK = "005-1002";
	// 兼职
	public static final String PART_TIME_WORK = "005-1001";
	// 面试通知信息
	public static final String INTERVIEW_NOTICE_TITLE = "面试通知";
	public static final String INTERVIEW_NOTICE_MESSAGE = "面试通知信息................";

	// **********Public constants start********
	public static final String EXPIRED = "已过期";
	public static final String NORMAL = "正常";
	public static final String STATUS_SUSPEND = "暂停";
	public static final String WHOLE = "全部";
	public static final String ENTER_KEYWORDS = "请输入关键字...";
	public static final String NO_LIMITED = "不限";
	public static final String SERVICE_ERROR_MESSAGE = "请确认已购买该服务，或服务已过期(可用次数不够).";
	public static final String USERTYPE_ERROR_PERSONAL = "个人用户不能进行此操作，请确认账号信息.";
	public static final String USERTYPE_ERROR_ENTERPRISE = "企业用户不能进行此操作，请确认账号信息.";
	public static final String FUNCTION_LIMITED = "功能被限制！请尽快完善博站资料.";

	// *********************Public constants end******

	// ******HeadhunterCenter Constant Begin
	public static final String IS_LOOK_OVER = "1";// 申请已被查看
	public static final String NO_LOOK_OVER = "0";// 申请暂未被查看
	public static final String IS_INTERVIEWS = "1";// 已邀请面试
	public static final String ALREADY_DELETED = "1";// 已删除
	public static final String NOT_DELETED = "0";// 未删除
	public static final int SHOW_THE_NUMBER_OF_POSTS = 10;// 职位搜索展示个数（默认）

	public static final int NUMBER_OF_AD_IMPRESSIONS_ONE = 8;// 页面图片广告展示个数（1位置）
	public static final int NUMBER_OF_AD_IMPRESSIONS_TWO = 6;// 页面文字广告展示个数（2位置）
	public static final int NUMBER_OF_AD_IMPRESSIONS_THREE = 1;// 页面图片广告展示个数（3位置）
	public static final int NUMBER_OF_AD_CITYSITE_ENTERPRISE=30;// 城市站点 热门城市企业 展示个数
	// *****HeadhunterCenter Constant End

	// *****PeopleExcavate Constant Begin
	public static final int WATER_SUPERVISION_DISPLAY_COUNT = 10;// 职位分类职位信息列表一列展示10个
	// 星级指数["一颗星","二颗星","三颗星","四颗星","五颗星"];
	public static final String CATEGORYINDEX_No_LIMIT = "不限";
	public static final String CATEGORYINDEX_ONE = "一颗星";
	public static final String CATEGORYINDEX_TWO = "二颗星";
	public static final String CATEGORYINDEX_THREE = "三颗星";
	public static final String CATEGORYINDEX_FOUR = "四颗星";
	public static final String CATEGORYINDEX_FIVE = "五颗星";
	public static final int NUMBER_OF_STAR_TALENT_SHOW = 10;// 人才之星展示个数
	public static final int NUMBER_OF_EXCAVATE_TALENT_SHOW = 10;// 挖掘人才展示个数(pageSize)
	// *********************PeopleExcavate Constant End

	// ****** EnterpriseCenter Constant Begin
	public static final String SUSPEND = "0";// 暂停
	public static final String PUBLISHING = "1";// 发布中(正常)
	public static final String COMPLETE = "2";// 过期
	public static final String IS_ABOUT_TO_EXPIRE = "3";// 即将到期

	public static final String SUSPEND_PUBLISHED_JOB = "suspendPublishedJob";// 暂停职位发布
	public static final String UNLOCK_PUBLISHING_JOB = "unlockPublishingJob";// 开启暂停发布的职位
	public static final String PUBLISHING_SUSPENDED_JOB = "publishingSuspendedJob";// 发布暂停发布的职位
	public static final String REPUBLISH_JOBS = "republishJobs";// 已结束的职位重新开启
	public static final String EXTENDED_RELEASE_DATE = "extendedRelease";// 已结束的职位重新开启
	// 已发送面试通知列表大小
	public static final int ENTERPRISECENTER_INTERVIEWNOTICE_LIST_SIZE = 10;
	// 证书需求信息列表大小
	public static final int ENTERPRISECENTER_CERTNEEDS_LIST_SIZE = 10;
	public static final String EXPIRING_CERTNEEDS = "3";// 即将过期的证书需求
	public static final String EXPIRED_CERTNEEDS = "4";// 已过期的证书需求
	// ****** EnterpriseCenter Constant End

	// **********Salon Module Begin ***********
	public static final String SALON_TYPE_ONLINE = "1"; // 线上沙龙
	public static final String SALON_TYPE_OFFLINE = "0"; // 线下沙龙

	public static final String SALON_TYPE_ONLINE_MSG = "线上沙龙"; // 线上沙龙
	public static final String SALON_TYPE_OFFLINE_MSG = "线下沙龙"; // 线下沙龙

	public static final String SALON_IS_EXCELLENT_NO = "0"; // 非经典沙龙
	public static final String SALON_IS_EXCELLENT_YES = "1"; // 经典沙龙

	public static final int SALON_HOME_ONLINE_SIZE = 9; // 沙龙首页线上沙龙显示个数

	public static final int SALON_HOME_OFFLINE_SIZE = 9; // 沙龙首页线下沙龙显示个数
	public static final int SALON_HOME_CLASSIC_SIZE = 6; // 沙龙首页经典沙龙显示个数
	public static final int SALON_HOME_OLD_SIZE = 7; // 沙龙首页往届沙龙显示个数
	public static final int SALON_HOME_CLASSIC_ARTICLE_SIZE = 6; // 沙龙首页经典文章显示个数
	public static final int SALON_HOME_HOST_UNIT_SIZE = 5; // 沙龙首页主办单位显示个数

	public static final int SALON_HOT_SIZE = 7; // 热门沙龙显示个数
	public static final int SALON_ONLINE_JION_USER_SIZE = 14; // 沙龙详情页面显示参加用户个数(线上沙龙)
	public static final int SALON_OFFLINE_JION_USER_SIZE = 12; // 沙龙详情页面显示参加用户个数(线下沙龙)
	public static final int SALON_DETAIL_PICTURE_SIZE = 4; // 沙龙详情页面显示图片个数
	public static final int SALON_DETAIL_VIDEO_SIZE = 4; // 沙龙详情页面显示图片个数
	public static final int SALON_DETAIL_ARTICLE_SIZE = 4; // 沙龙详情页面显示图片个数
	public static final int SALON_DETAIL_COMMENT_SIZE = 3; // 沙龙详情页面显示评论个数
	public static final int ARTICLE_HOT_SIZE = 10; // 热门文章显示个数
	public static final int ARTICLE_AUTHOR_SIZE = 10; // 作者相关文章显示个数

	public static final String ARTICLE_IS_EXCELLENT_NO = "0"; // 非经典文章
	public static final String ARTICLE_IS_EXCELLENT_YES = "1"; // 经典文章
	public static final String ARTICLE_IS_RECOMMENT_NO = "0"; // 非推荐文章
	public static final String ARTICLE_IS_RECOMMENT_YES = "1"; // 推荐文章
	public static final String ARTICLE_IS_CREAM_NO = "0"; // 非精华文章
	public static final String ARTICLE_IS_CREAM_YES = "1"; // 精华文章
	public static final String MEDIA_IS_EXCELLENT_NO = "0"; // 非经典媒介
	public static final String MEDIA_IS_EXCELLENT_YES = "1"; // 经典媒介
	// 公用的是与否显示
	public static final String MSG_NO = "否"; // 否
	public static final String MSG_YES = "是"; // 是

	// 沙龙搜索
	public static final String SALON_SEARCH_TITLE = "015";

	public static final String SALON_SEARCH_TITLE_SALONNAME = "015-1001";// 沙龙名称
	public static final String SALON_SEARCH_TITLE_SALONPIC = "015-1002";// 沙龙图片
	public static final String SALON_SEARCH_TITLE_SALONVEDIO = "015-1003";// 沙龙视频
	public static final String SALON_SEARCH_TITLE_SALONARTICLE = "015-1004";// 沙龙文章

	public static final String SALON_SEARCH_SALONNAME_LAUNCH = "015-1001-1001";// 沙龙发起人
	public static final String SALON_SEARCH_SALONNAME_NAME = "015-1001-1002";// 沙龙名称
	public static final String SALON_SEARCH_SALONNAME_INTROU = "015-1001-1003";// 沙龙简介

	public static final String SALON_SEARCH_SALONPIC_SUBJECT = "015-1002-1001";// 图片标题
	public static final String SALON_SEARCH_SALONPIC_AUTHOR = "015-1002-1002";// 图片作者
	public static final String SALON_SEARCH_SALONVID_SUBJECT = "015-1003-1001";// 视频标题
	public static final String SALON_SEARCH_SALONVID_AUTHOR = "015-1003-1002"; // 视频作者

	public static final String SALON_SEARCH_SALONARTICLE_SUBJECT = "015-1004-1001";// 文章标题
	public static final String SALON_SEARCH_SALONARTICLE_CONTENT = "015-1004-1002";// 文章内容
	public static final String SALON_SEARCH_SALONARTICLE_AUTHOR = "015-1004-1003";// 文章作者

	// 线下沙龙栏目
	public static final String SALON_OFFLINE_COLUMN = "018";
	public static final String SALON_OFFLINE_COLUMN_1001 = "018-1001";// 嘉宾致辞
	public static final String SALON_OFFLINE_COLUMN_1002 = "018-1002";// 嘉宾观点
	public static final String SALON_OFFLINE_COLUMN_1003 = "018-1003";// 用户观点
	public static final String SALON_OFFLINE_COLUMN_1004 = "018-1004";// 嘉宾讨论
	public static final String SALON_OFFLINE_COLUMN_1005 = "018-1005";// 嘉宾互动
	public static final String SALON_OFFLINE_COLUMN_1006 = "018-1006";// 用户互动

	// 状态 0-待审核，1-通过，2-不通过
	public static final String STATUS_PENDING = "0";
	public static final String STATUS_PASSED = "1";
	public static final String STATUS_NOT_PASS = "2";

	// 状态 0-待审核，1-通过，2-不通过
	public static final String STATUS_PENDING_MSG = "待审核";
	public static final String STATUS_PASSED_MSG = "通过";
	public static final String STATUS_NOT_PASS_MSG = "不通过";
	// 系统参数需要
	public static final String MEDIA_AUDI_FLAG_PICTURE_CODE = "10001";// 图片
	public static final String MEDIA_AUDI_FLAG_VIDEO_CODE = "10002";// 视频

	public static final String MEDIA_AUDI_FLAG_NEED = "1";// 需要审核才可以看到
	public static final String MEDIA_AUDI_FLAG_NO_NEED = "0";// 不要审核，就直接可以看到

	public static final String MEDIA_TYPE_PICTURE = "0"; // 媒介类型 --图片
	public static final String MEDIA_TYPE_VIDEO = "1"; // 媒介类型 --视频

	public static final String COMMENT_SUBJECT_TYPE_ARTICLE = "0"; // 文章评论
	public static final String COMMENT_SUBJECT_TYPE_PICTURE = "1"; // 图片评论
	public static final String COMMENT_SUBJECT_TYPE_VIDEO = "2"; // 视频评论
	public static final String COMMENT_SUBJECT_TYPE_SALON = "3"; // 沙龙评论

	// *********************Salon Module END ****************************

	// *****************************Paging util Begin
	public static final String PAGING_FROM_FLAGS_OTHER = "0"; // from other
	public static final String PAGING_FROM_FLAGS_NUMBER = "1"; // from goto page
																// or page
																// number

	// *****************************Paging util End
	/** 积分类型 【开始】 **/
	public static final String POINT_COMMENT = "1001"; // 评论
	public static final String POINT_UPLOADING_ARTICLE = "1002";// 上传文件
	public static final String POINT_UPLOADING_VIDEO = "1003"; // 上传视频
	public static final String POINT_UPLOADING_PICTURE = "1004"; // 上传图片
	/** 积分类型 【结束】 **/
	// 用户状态 - 0 正常 1 停用
	public static final String STATUS_USER_ABLED = "1";
	public static final String STATUS_USER_UNABLED = "0";

	/**********************************************************************
	 ************************ 个人用户后台开始*************************************
	 ************************************************************************/
	// 个人用户后台，已提交证书列表大小
	public static final int PERSONALCENTER_SUBMITEDCERT_LIST_SIZE = 10;
	// 个人用户后台，面试通知列表大小
	public static final int PERSONALCENTER_INTERVIEWNOTICE_LIST_SIZE = 10;
	// 收件人列表大小
	public static final int RECEIVE_CONTACT_LIST_SIZE = 10;
	// 系统消息标题
	public static final String SYS_SHORTMSG_TITLE = "系统消息";

	/**********************************************************************
	 ************************ 个人用户后台结束*************************************
	 ************************************************************************/

	public static final int NUMBER_OF_HOT_FUNCTIONS_OF_THE_DISPLAY = 20;// 热门职能展示个数设置
	public static final int SHOW_THE_NUMBER_OF_CITY_SITES = 30;// 城市站点展示个数设置
	public static final int CITY_SITE_RELEASE_TIMES = 1;// 城市站点相同职位出现次数（多少次）为热门职位。
	public static final int CITY_SITE_CLICKS = 1;// 城市站点 统计为热门职位的点击率

	// 系统服务
	public static final String SERVICE_ITEM_NAME_TALENTSFOUND_OFFLINE = "线下人才挖掘服务";
	public static final String SERVICE_ITEM_NAME_TALENTSFOUND = "人才挖掘服务";
	public static final String SERVICE_ITEM_NAME_HANGCARD = "挂证服务";
	public static final String SERVICE_ITEM_NAME_HUNTCARD = "猎证服务";
	public static final String SERVICE_ITEM_NAME_RECRUIT = "招聘服务";
	public static final String SERVICE_ITEM_NAME_ADVERT = "广告位服务";

	public static final String SERVICE_ITEM_NAME_TALENTSFOUND_OFFLINE_CODE = "0";
	public static final String SERVICE_ITEM_NAME_TALENTSFOUND_CODE = "1";
	public static final String SERVICE_ITEM_NAME_HANGCARD_CODE = "2";
	public static final String SERVICE_ITEM_NAME_HUNTCARD_CODE = "3";
	public static final String SERVICE_ITEM_NAME_RECRUIT_CODE = "4";
	public static final String SERVICE_ITEM_NAME_ADVERT_CODE = "5";

	// 服务 剩余次数 列
	public static final String SERVICE_1_REMAINS = "1";
	public static final String SERVICE_2_REMAINS = "2";
	public static final String SERVICE_3_REMAINS = "3";

	// 订单状态
	public static final String ORDER_STATUS_0 = "0"; // 未支付
	public static final String ORDER_STATUS_1 = "1"; // 已支付
	public static final String ORDER_STATUS_2 = "2"; // 已过期
	public static final String ORDER_EXTENSION_FLAG_YES = "1";// 已在续期标志
	public static final String ORDER_EXTENSION_FLAG_NO = "0";// 可 续期标志
	public static final String ORDER_EXTENSION_FLAG_DISABLED = "2";// 不可 续期标志
	public static final String ORDER_SERVICE_STATUS_ENABLED = "0"; // 有效
	public static final String ORDER_SERVICE_STATUS_EXPIRED = "1"; // 已过期
	public static final String ORDER_SERVICE_STATUS_ENTENSION = "2"; // 续期
	public static final String ORDER_SERVICE_STATUS_DISABLED = "3"; // 无效
	public static final String ORDER_PAY_DUE_TIME = "10003";// 支付期限
	public static final int ORDER_DAY_END = 3;// 到期日期设置

	public static final String SYS_INCREMENT_ADVERSITING_SEARCH_POSITION = "017";
	public static final String SYS_INCREMENT_TALENTS_SEARCH_FIELD = "016";
	public static final String UPLOAD_FILE_PATH = "uploadFilePath";// 文件上传的properties
	public static final String FILE_SERVER_PATH = "fileServerURL";// 访问上传文件的URL
	public static final String BLOG_WEB_URL = "blogWebURL";// 博站的URL

	public static final String APPLICATIONS_RECEIVED_NOT_SEE = "未查看"; // 未查看
	public static final String APPLICATIONS_RECEIVED_VIEWED = "已查看未邀请";// 已查看
	public static final String APPLICATIONS_RECEIVED_INVITATION_HAS_BEEN_SENT = "已发面试邀请";// 已发送邀请
	// 模板路径
	public static final String TEMPLATE_ROOT_PATH_DIRECTORY = "template.root.path.directory";
	// html路径
	public static final String HTML_ROOT_PATH_DIRECTORY = "html.root.path.directory";
	// 路径别名
	public static final String ROOT_PATH = "root.path";
	// 前台访问根路径
	public static final String FRONT_HTTP_PATH = "front.http.path";
	// 提示已经参加了沙龙，不需要重复参与
	public static final String SALON_ATTEND_EXIST_MSG = "你已经参加了此沙龙,不能重复参加!";
	// 提示没有参加沙龙，不能评论
	public static final String SALON_NOT_ATTEND_ADD_COMMENT_MSG = "你还没有加入此沙龙,不能参加评论!";
	// 提示没有参加沙龙，不能评论
	public static final String SALON_IS_LOGIN_MSG = "登录成功！";
	// 提示没有参加沙龙，不能上传文件
	public static final String SALON_NOT_ATTEND_UPLOAD_FILE_MSG = "你还没有加入此沙龙,不能上传文件!";
	// 提示没有参加沙龙，不能上传沙龙内容
	public static final String SALON_NOT_ATTEND_UPLOAD_ARTICLE_MSG = "你还没有加入此沙龙,不能上传沙龙内容!";

	// 提示发表评论成功
	public static final String SUBMIT_COMMENT_MSG = "你的评论已经提交成功，请等待管理员的审核!";
	// 提示提交的内容存在敏感词汇
	public static final String KEY_WORD_MSG = "你提交的内容有敏感词汇,请检查!";
	// 提示输入的顺序号不合法
	public static final String ORDER_SEQ_NO_PASS_MSG = "你输入的顺序号不正确!";
	// 提示完善博站信息
	public static final String BLOG_REMIND_MSG = "请先完善博站信息";
	// 提示存在未审核的记录
	public static final String EXIST_NO_PASS_MSG = "你选择的记录中不全是审核通过的记录";

	// 017','增值服务广告
	// 017-1001','首页
	public static final String SERVICE_ADVERT_HOMEPAGE_TOP = "017-1001-1001";// 首页---顶部的图片位置
	public static final String SERVICE_ADVERT_HOMEPAGE_CITYPAGE_001 = "017-1001-1002";// 首页---城市站点页面---推荐企业位置
	public static final String SERVICE_ADVERT_HOMEPAGE_CITYPAGE_002 = "017-1001-1003";// 首页---城市站点页面---城市热门企业位置
	// 017-1002','猎头中心
	public static final String SERVICE_ADVERT_HUNTHEAD_001 = "017-1002-1001";// 猎头中心---推荐企业位置
	// 017-1003','人才挖掘
	public static final String SERVICE_ADVERT_TALENTS_FOUND_001 = "017-1003-1001";// 人才挖掘---右边轮播位置
	// 017-1004','创业沙龙
	public static final String SERVICE_ADVERT_SALON_001 = "017-1004-1001";// 创业沙龙---右边轮播位置
	public static final String SERVICE_ADVERT_SALON_002 = "017-1004-1002";// 创业沙龙---主办单位位置
	// 017-1005','招聘广告
	public static final String SERVICE_ADVERT_RECRUIT_001 = "017-1005-1001";// 招聘广告---右边轮播位置 多个
	public static final String SERVICE_ADVERT_RECRUIT_002 = "017-1005-1002";// 招聘广告---左边上半部分位置 1个
	public static final String SERVICE_ADVERT_RECRUIT_003 = "017-1005-1003";// 招聘广告---左边名企招聘 多个
	public static final String SERVICE_ADVERT_RECRUIT_004 = "017-1005-1004";// 招聘广告---左边热门招聘 多个
	public static final String SERVICE_ADVERT_RECRUIT_005 = "017-1005-1005";// 招聘广告---左边紧急招聘 多个

	public static final String AD_TYPE_IMAGE = "0"; // 图片
	public static final String AD_TYPE_TEXT = "1"; // 文字
	public static final String AD_TYPE_FLASH = "2"; // flash
	public static final String AD_TYPE_IMAGE_AND_FLASH = "4"; // 图片

	// 图片大小key
	public static final String UPLOADFILE_IMG_SIZE = "uploadFile.img.size";
	// flash大小key
	public static final String UPLOADFILE_FLASH_SIZE = "uploadFile.flash.size";
	// 视频大小k
	public static final String UPLOADFILE_VIDEO_SIZE = "uploadFile.video.size";

	// 人才挖掘 字段设置
	public static final String TALENTS_SEARCH_INDUSTRYTYPE="016-1001";//'行业类型',
	public static final String TALENTS_SEARCH_SPECIALIZEDTYPE="016-1002";//'专业类型',
	public static final String TALENTS_SEARCH_COMPETENCY="016-1003"; //职能名称
	public static final String TALENTS_SEARCH_REGION="016-1004"; //'地    区'
	public static final String TALENTS_SEARCH_METIER="016-1005";//'专    长',
	public static final String TALENTS_SEARCH_EDUCATION="016-1006";//'学    历',
	public static final String TALENTS_SEARCH_WORKINGLIFE="016-1007";//'工作年限',
	public static final String TALENTS_SEARCH_AGE="016-1008";//'年    龄',
	public static final String TALENTS_SEARCH_SEX="016-1009";//'性    别',
	public static final String TALENTS_SEARCH_LANGCAPA="016-1010";//'语言能力',
	public static final String TALENTS_SEARCH_MASTERY="016-1011";//'掌握程度',
	public static final String TALENTS_SEARCH_COMPUTERGRADE="016-1012";//'计算机能力
	public static final String TALENTS_SEARCH_ISADVISER="016-1013";//'顾    问',
	public static final String TALENTS_SEARCH_JOBNATURE="016-1014";//'工作性质',
	public static final String TALENTS_SEARCH_USERINFOUPDATEDATE="016-1015";//'更新日期',
	public static final String TALENTS_SEARCH_CATEGORYINDEX="016-1016";//'星级指数',
	public static final String TALENTS_SEARCH_KEYWORD="016-1017";//'职位关键字

	// 日期比较状态
	public static final String DATE_COMPARISON_STATUS_SAME ="same";
	public static final String DATE_COMPARISON_STATUS_BEFORE ="before";
	public static final String DATE_COMPARISON_STATUS_AFTER ="after";
	
	public static final String DOTOYO_DEFAULT_URL ="#";
	public static final String DOTOYO_DEFAULT_TITLE ="DOTOYO";
	public static final String DOTOYO_DEFAULT_IMG002 ="advertisement-widows.jpg";
	public static final String DOTOYO_DEFAULT_IMG003 ="advertisement3.jpg";
	public static final String DOTOYO_DEFAULT_IMG004 ="advertisement4.jpg";
	public static final String DOTOYO_DEFAULT_IMG001 ="advertisement1.jpg";
	public static final String DOTOYO_DEFAULT_IMG005 ="advertisement5.jpg";
	public static final String DOTOYO_DEFAULT_IMG006 ="advertisement6.jpg";
	
	public static final String DOTOYO_DEFAULT_IMG007 ="advertisement7.jpg";
	public static final String DOTOYO_DEFAULT_IMG008 ="advertisement8.jpg";
	


}
