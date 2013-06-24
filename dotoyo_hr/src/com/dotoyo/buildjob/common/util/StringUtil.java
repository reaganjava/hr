package com.dotoyo.buildjob.common.util;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import java.util.regex.Pattern;

import com.dotoyo.buildjob.sys.dto.SysFilterWordDto;

/**
 * Tool class of String
 *
 * @author wisdy.xiao
 *
 */
public final class StringUtil {
	/**
	 * Enforce Singleton pattern.
	 */
	private StringUtil() {
	}

	private final static class helper {
		private static StringUtil util;

		private static StringUtil fetchPojo() {
			if (util == null) {
				util = new StringUtil();
			}
			return util;
		}
	}
	public String sNullObj(Object obj){
		return obj == null ? null : obj.toString().trim();
	}
	/**
	 * Convert price to a number which have two digit.
	 *
	 * @param price
	 * @return
	 */
	public String convertPrice(String price) {
		if (isDouble(price)) {
			DecimalFormat myformat = new DecimalFormat("#####0.00");
			price = myformat.format(Double.valueOf(price));
		}
		return price;
	}

	/**
	 * Convert sum
	 *
	 * @param price
	 * @return
	 */
	public String convertNum(String num, int per) {
		String s = "";
		for (int i = 0; i < per; i++) {
			s = s + "0";
		}
		String aftersum = "";
		Double d = Math.abs(Double.valueOf(num));
		DecimalFormat myformat = new DecimalFormat("#####0." + s);
		aftersum = myformat.format(d);
		if (Double.valueOf(num) < 0) {
			aftersum = "-" + aftersum;
		}
		return aftersum;
	}

	/**
	 * Override method
	 *
	 * @param num
	 * @param per
	 * @return
	 */
	public String convertNum(double num, int per) {
		String s = String.valueOf(num);
		return convertNum(s, per);
	}

	/**
	 * New Instance of String Util
	 *
	 * @return
	 */
	public static StringUtil newInstance() {
		return helper.fetchPojo();
	}

	public String sNull(Object obj) {
		return obj == null ? "" : obj.toString().trim();
	}
	public String sCsvNull(Object obj){
		return obj == null ? "" : obj.toString().trim().replaceAll(",", "\uff0c");
	}
	public String sNullTrim(Object obj) {
		return sNull(obj).trim();
	}

	public String trim(Object obj) {
		return obj != null ? obj.toString().trim() : null;
	}
	//天数操作
    public Date Ds(int days) {
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        int day = calendar.get(Calendar.DAY_OF_YEAR);
        calendar.set(Calendar.DAY_OF_YEAR, day + days);
        Date cc = calendar.getTime();
        return cc;
    }
	/**
	 * Transfer date from DB to page
	 *
	 * @param dbDate
	 * @return
	 */
	public Date transferDateFromDToP(String dbDate) {
		if (sNullTrim(dbDate).equals(""))
			return null;
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhss");
		Date da = null;
		try {
			da = format.parse(dbDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return da;
	}

	public Boolean isDouble(String o) {
		// /^[-\+]?\d+(\.\d+)?$
		String str = o;
		if(o.indexOf("-") >=0){
			str = str.substring(1,str.length());
		}
		return Pattern.matches("^\\d+(\\.\\d+)?$", str);
	}

	public Boolean isDoubleByTwoDigit(String o) {
		return Pattern.matches("^\\d+(\\.\\d{0,2})?$", o);
	}

	public Boolean isInteger(String o) {
		if(o == null) return false;
		return Pattern.matches("^\\d+?$", o);
	}

	public Boolean isInteger(char o) {
		return isInteger(String.valueOf(o));
	}

	public Boolean isAgreeRuleChar(String o) {

		return Pattern.matches("[a-zA-Z]", o);
	}

	public Boolean isAgreeRuleChar(char o) {

		return isAgreeRuleChar(String.valueOf(o));
	}

	/**
	 * Transfer date from page to DB
	 *
	 * @param date
	 * @return
	 */
	public String transferDateFromPToD(Date date) {
		if (date == null)
			return null;
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
		return format.format(date);
	}

	/**
	 * Fetch current time
	 *
	 * @return format yyyyMMddHHmm
	 */
	public String fetchNow() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
		return format.format(new Date());
	}
	public String fetchNow(String prex) {
		SimpleDateFormat format = new SimpleDateFormat(prex);
		return format.format(new Date());
	}
	public String convertDate(String prex,String date){
		try{
			SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat format = new SimpleDateFormat(prex);
			Date da = format1.parse(date);
			return format.format(da);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Fetch date by day
	 *
	 * @param date
	 * @return format yyyyMMdd
	 */
	public String fetchDateByDay(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.format(date);
	}
	public String convertDate(String fromFormat,String toFormat,String date){
		try{
			if(sNull(date).equals(""))return "";
			SimpleDateFormat format1 = new SimpleDateFormat(fromFormat);
			SimpleDateFormat format = new SimpleDateFormat(toFormat);
			Date da = format1.parse(date);
			return format.format(da);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * Fetch date by month
	 *
	 * @param date
	 * @return format yyyyMM
	 */
	public String fetchDateByMonth(Date date) {
		if(date == null) return "209913";
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		return format.format(date);
	}
	/**
	 * Create 20 bit id
	 *
	 * @return
	 */
	public String createIdTwenty() {
		String mills = String.valueOf(System.currentTimeMillis());
		String times = fetchNow().substring(5, 12);
		return mills + times;
	}
	public String createIdTwenty(int x,String id){
		return id.substring(0, id.length()-1) + x;
	}
	/**
	 * Create id
	 * @param prex
	 * @param i
	 * @param total
	 * @param id
	 * @return
	 */
	public String createIdTwenty(String prex,int i,int total,String id){
		//public String getStringByDigit(int i,String prex,int total){
			String x = String.valueOf(i);
			String result = "";
			for(int j = 0;j < total - x.length();j++){
				result += prex+"";
			}
			return id.substring(0, id.length()-total) + result+x;
			//return result+x;
		//}
	}
//	public static void main(String[] args) {
//		StringUtil util = StringUtil.newInstance();
////		// System.out.println(util.checkDic("/s"));
////		String str = util.fetchStr("backup 11241125", 7);
////		System.out.println(str);
//		//String da = "201012022207";
//		//util.convertDate("yyyy/MM/dd HH:mm", da);
//		//System.out.println(util.getStringByDigit(10115, "0", 4));
//		//System.out.println(util.fetchNow("yyMMdd"));
//	}

	/**
	 * Convert String character into double type.
	 *
	 * @param num
	 * @return
	 */
	public double convertSToD(String num) {
		if (sNull(num).equals(""))
			num = "0";
		return Double.valueOf(num);
	}

	public boolean checkDic(String co) {
		return Pattern.matches("/*", co);
	}

	/**
	 * Fetch the first day date of the mouth which has been inputed.
	 *
	 * @param date
	 * @return
	 */
	public Date fetchFirstDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return cal.getTime();
	}
	/**
	 * Fetch date by year + month
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public Date fetchDateOfMonth(String year,String month) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		return format.parse(year+ "" + month);
	}
	/**
	 * Fetch first date of year you input yyyy
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public Date fetchFirstDayOfYear(String year) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.parse(year+"0101");

	}
	/**
	 * Fetch last date of year you input yyyy
	 * @param year
	 * @return
	 * @throws Exception
	 */
	public Date fetchLastDayOfYear(String year) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.parse(year+"1231");

	}
	/**
	 * Fetch the last day date of the mouth which has been inputed.
	 *
	 * @param date
	 * @return
	 */
	public Date fetchLastDayOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.roll(Calendar.DAY_OF_MONTH, -1);
		return cal.getTime();
	}

	/**
	 * The code can only contains English character or digit or "-"
	 *
	 * @param co
	 * @return
	 */
	public boolean checkDDT(String co) {
		return Pattern.matches("^[0-9a-zA-Z-]+?$", co);
	}

	/**
	 * Pattern of component code, The char is in front of two position of code
	 * must be \\s and + character or digit
	 *
	 * @param co
	 * @return
	 */
	public boolean checkCptCode(String co) {
		return Pattern.matches("^[a-zA-Z]{2}+[0-9a-zA-Z]+?$", co);
	}

	/**
	 * Pattern of service code, The char is in front of two position of code
	 * must be character and four digit is after it.
	 *
	 * @param co
	 * @return
	 */
	public boolean checkSrvCode(String co) {
		return Pattern.matches("^[a-zA-Z]{2}+[0-9]{4}+", co);
	}

	/**
	 * Pattern of format code, The char is in front of two position of code must
	 * be character and digit or character is after it.
	 *
	 * @param co
	 * @return
	 */
	public boolean checkFmtCode(String co) {
		return Pattern.matches("^[a-zA-Z]{2}+[0-9a-zA-Z]+?$", co);
	}

	/**
	 * Fetch max number
	 *
	 * @param db
	 * @return
	 */
	public Double fetchMax(List<Double[]> dbs) {
		if (dbs == null)
			return 0.0;
		if (dbs.isEmpty())
			return 0.0;
		double max = 0.0;
		for (Double db[] : dbs) {
			for (double d : db) {
				if (d > max) {
					max = d;
				}
			}
		}
		return max;
	}
	/**
	 * fetch previous string by digit
	 * @param str
	 * @param start
	 * @param end
	 * @return string
	 */
	public String fetchStr(String str,int start,int end){
		if(str == null) return "";
		if(str.length() < end) return "";
		return str.substring(start, end);
	}
	/**
	 * fetch previous string by digit
	 * @param str
	 * @param start
	 * @return string
	 */
	public String fetchStr(String str,int start){
		if(str == null) return "";
		if(str.length() < start) return "";
		return str.substring(start);
	}
	/**
	 * unpack string array
	 * @param str
	 * @param separator
	 * @return string array
	 */
	public String [] split(String str,String separator){
		if(str == null ) return null;
		return str.split(separator);
	}
	/**
	 * Transfer String collection to Characters
	 * @param collection
	 * @return
	 */
	public String convertCollectionToStr(Collection<String> collection)
	{
		if (collection == null) return "";
		String sReturn = "";
		for (Object o : collection)
		{
			sReturn = sReturn + sNull(o).toString() + ",";
		}
		int lastIndex = sReturn.lastIndexOf(",");
		if (lastIndex > -1)
		{
			sReturn = sReturn.substring(0, lastIndex);
		}
		return "[" + sReturn + "]";
	}
	/**
	 * Fetch number 00001,0010
	 * @param i
	 * @param prex
	 * @param total
	 * @return
	 */
	public String getStringByDigit(int i,String prex,int total) throws Exception{
		String x = String.valueOf(i);
		String result = "";
		if(x.length() > total) throw new Exception("largest limit!");
		for(int j = 0;j < total - x.length();j++){
			result += prex+"";
		}
		return result+x;
	}
	public String getGbkStr(String str){
		try{
			String str1 = new String(str.getBytes("GBK"), "iso-8859-1");
			return str1;
		}catch(Exception e){
			return "error" + e.getMessage();
		}

	}
	/** 7位ASCII字符，也叫作ISO646-US、Unicode字符集的基本拉丁块 */
	 public static final String US_ASCII = "US-ASCII";

	 /** ISO 拉丁字母表 No.1，也叫作 ISO-LATIN-1 */
	 public static final String ISO_8859_1 = "ISO-8859-1";
	 public static final String ISO8859_1 = "ISO8859_1";

	 /** 8 位 UCS 转换格式 */
	 public static final String UTF_8 = "UTF-8";

	 /** 16 位 UCS 转换格式，Big Endian（最低地址存放高位字节）字节顺序 */
	 public static final String UTF_16BE = "UTF-16BE";

	 /** 16 位 UCS 转换格式，Little-endian（最高地址存放低位字节）字节顺序 */
	 public static final String UTF_16LE = "UTF-16LE";

	 /** 16 位 UCS 转换格式，字节顺序由可选的字节顺序标记来标识 */
	 public static final String UTF_16 = "UTF-16";

	 /** 中文超大字符集 */
	 public static final String GBK = "GBK";

	 /**
	  * 将字符编码转换成US-ASCII码
	  */
	 public String toASCII(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, US_ASCII);
	 }
	 /**
	  * 将字符编码转换成ISO-8859-1码
	  */
	 public String toISO_8859_1(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, ISO_8859_1);
	 }
	 /**
	  * 将字符编码转换成UTF-8码
	  */
	 public String toUTF_8(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, UTF_8);
	 }
	 /**
	  * 将字符编码转换成UTF-16BE码
	  */
	 public String toUTF_16BE(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, UTF_16BE);
	 }
	 /**
	  * 将字符编码转换成UTF-16LE码
	  */
	 public String toUTF_16LE(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, UTF_16LE);
	 }
	 /**
	  * 将字符编码转换成UTF-16码
	  */
	 public String toUTF_16(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, UTF_16);
	 }
	 /**
	  * 将字符编码转换成GBK码
	  */
	 public String toGBK(String str) throws UnsupportedEncodingException{
	  return this.changeCharset(str, GBK);
	 }

	 /**
	  * 字符串编码转换的实现方法
	  * @param str  待转换编码的字符串
	  * @param newCharset 目标编码
	  * @return
	  * @throws UnsupportedEncodingException
	  */
	 public String changeCharset(String str, String newCharset)
	   throws UnsupportedEncodingException {
	  if (str != null) {
	   //用默认字符编码解码字符串。
	   byte[] bs = str.getBytes();
	   //用新的字符编码生成字符串
	   return new String(bs, newCharset);
	  }
	  return null;
	 }
	 /**
	  * 字符串编码转换的实现方法
	  * @param str  待转换编码的字符串
	  * @param oldCharset 原编码
	  * @param newCharset 目标编码
	  * @return
	  * @throws UnsupportedEncodingException
	  */
	 public String changeCharset(String str, String oldCharset, String newCharset)
	   throws UnsupportedEncodingException {
	  if (str != null) {
	   //用旧的字符编码解码字符串。解码可能会出现异常。
	   byte[] bs = str.getBytes(oldCharset);
	   //用新的字符编码生成字符串
	   return new String(bs, newCharset);
	  }
	  return null;
	 }
	 public String GBKToISO(String str) throws Exception{
		 //new String(fileName.getBytes("GBK"),"ISO8859_1")
		 return changeCharset(str,GBK,ISO_8859_1);
	 }
	 public String UTF8ToGBK(String str) throws Exception{
		 //new String(fileName.getBytes("GBK"),"ISO8859_1")
		 return changeCharset(str,UTF_8,GBK);
	 }
	public int returnChineseCharTotal(String str){
		char[] cs = str.toCharArray();
		int k = 0;
		for(int i = 0;i < cs.length;i++){
			if(Pattern.matches("[^\\x00-\\xff]", String.valueOf(cs[i]))){
				k++;
			}
		}
		return k;
	}
	public int returnCharLen(String str){
		return str.replaceAll("[^\\x00-\\xff]", "**").length();
	}
	public int returnByteLen(String str){
		return str.getBytes().length;
	}
	public static String returnRealCharByLen(String str,int len){
		byte[] bys = str.getBytes();
		String s = "";
		byte tmp[] = new byte[3];//存储汉字
		int j = 0;
		for(int i = 0;i < bys.length;i++){
			if(i < len){
				if(bys[i] < 0){
					tmp[j] = bys[i];
					j++;
					if(j == 3){
						s+= new String(tmp);
						//转汉字
						j = 0;
					}
				}else{
					s += String.valueOf((char)bys[i]);
				}
			}
		}
		return s;
	}
	/**
	 * 检查过滤词
	 * @param forWords
	 * @return
	 */
	public static String isExistsFilterWords(String forWords){
		if(forWords == null) return null;
		List<SysFilterWordDto> list = EssentialDataUtil.getFilterWordsByWord();
		Vector<String> vector = new Vector<String>();
		for(SysFilterWordDto dto : list){
			if(forWords.toLowerCase().indexOf(dto.getWords().toLowerCase()) >=0){
				if(!vector.contains(dto.getWords().trim())){
					vector.add(dto.getWords().trim());
				}
			}
		}
		processVector(vector);
		String words = null;
		for(String word : vector){
			if(words == null){
				words = word;
			}else{
				words += ", " + word;
			}
			if(words.length() > 100){
				words += "...";
				break;
			}
		}
		return words;
	}
	private static void processVector(Vector<String> vector){
		for(int i = 0;i < vector.size();i++){
			String word1 = vector.get(i);
			for(int j = 0;j < vector.size();j++){
				String word2 = vector.get(j);
				if(!word1.equals(word2)){
					if(word1.indexOf(word2) >= 0){
						vector.remove(word1);
						processVector(vector);
					}
				}
			}
		}
	}
	/**
	 * 积分计算
	 * @param oldPoint 原有积分
	 * @param increasePoint 增加的积分
	 * @return
	 */
	public Long getAddPoint(Long oldPoint,Long increasePoint){
		if(oldPoint == null || increasePoint == null) return Long.valueOf(0);
		Long respoint;
		if((oldPoint + increasePoint) > Long.valueOf("9999999999")){
			respoint = Long.valueOf("9999999999") - oldPoint;
		}else if((oldPoint + increasePoint) < Long.valueOf("-9999999999")){
			respoint = Long.valueOf("-9999999999") - oldPoint;
		}else{
			respoint = increasePoint;
		}
		return respoint;
	}
}