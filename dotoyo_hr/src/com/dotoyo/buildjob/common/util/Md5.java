package com.dotoyo.buildjob.common.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

/**
 * @author tyler.qu
 * @dateCreated 2010-11-29
 * @description
 *
 */
public class Md5 {
		public static String encoderByMd5(String str){
	        MessageDigest md5 = null;
	        String newstr = null;
			try {
				md5 = MessageDigest.getInstance("MD5");
				BASE64Encoder base64en = new BASE64Encoder();
				newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
	        return newstr;
	    }

		public static void main(String[] args){
			String pssword="123456";
			System.out.println(encoderByMd5(pssword));
			System.out.println(encoderByMd5(pssword));
		}
}
