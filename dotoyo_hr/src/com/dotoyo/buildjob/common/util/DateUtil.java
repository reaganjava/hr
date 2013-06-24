package com.dotoyo.buildjob.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-1
 * @description
 * 
 */
public class DateUtil {

	/**
	 * 格式化Date型为String pattern
	 * @param date
	 * @return
	 */
	private static String dateFormatStr = "yyyy-MM-dd";
	private static DateFormat sdf = new SimpleDateFormat(dateFormatStr);
	public static DateFormat getDateFormat() {
		return sdf;
	}

	/**
	 * 日期比较（年-月-日）
	 * @param date
	 * @return
	 */
	public static String dateComparison(Date oneDate,Date twoDate){
		    Date d1,d2;
			try {
				d1 = sdf.parse(getDateString(oneDate));
				d2 = sdf.parse(getDateString(twoDate));
				return d1.equals(d2)?ApplicationConstant.DATE_COMPARISON_STATUS_SAME:(d1.before(d2)?ApplicationConstant.DATE_COMPARISON_STATUS_BEFORE:ApplicationConstant.DATE_COMPARISON_STATUS_AFTER);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		return null;
	}

	public static String getDateString(Date date) {
		return getDateFormat().format(date);
	}
	
	public static String getFormatDateByFormat(Date date, String patten) {
		SimpleDateFormat sdf = new SimpleDateFormat(patten);
		return sdf.format(date);
	}

	/**
	 * 获取系统当前日期
	 * @param date
	 * @return
	 */
	public static String getCurrentDateString() {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return sf.format(new java.util.Date());
	}

	/**
	 * 获取系统当前日期
	 * @param date
	 * @return
	 */
	public static String getCurrentDateString(String pattern) {
		SimpleDateFormat sf = new SimpleDateFormat(pattern);
		return sf.format(new java.util.Date());
	}
	
	/**
	 * 格式化String型为Date yyyy-MM-dd
	 * @param date
	 * @return
	 */
	public static Date parseToDate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (date == null || date.trim().equals("")) {
			date = sdf.format(new Date());
		}
		try {
			return sdf.parse(date);
		} catch (Exception e) {
		}
		return null;
	}
	public static Date parseToDate(Date date,String pattern) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			return sdf.parse(format.format(date));
		} catch (Exception e) {
			return null;
		}
		
	}
	
	/**
	 * 增加日期数
	 * @param day
	 * @param x
	 * @return
	 */
	public static Date addDate(Date date, int x) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, x);
		date = cal.getTime();
		cal = null;
		return parseToDate(format.format(date));
	}

	public static void main(String[] args) {
		
		
	
	}
}
