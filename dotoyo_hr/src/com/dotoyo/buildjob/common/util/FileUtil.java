package com.dotoyo.buildjob.common.util;

import java.io.File;
import java.text.DecimalFormat;
/**
 * 文件信息类
 * @author wisdy.xiao
 *
 */
public class FileUtil {
	/**
	 * Enforce Singleton pattern.
	 */
	private FileUtil() {
	}

	private final static class helper {
		private static FileUtil util;

		private static FileUtil fetchPojo() {
			if (util == null) {
				util = new FileUtil();
			}
			return util;
		}
	}
	public static FileUtil getInstance(){
		return helper.fetchPojo();
	}
	public final char FILE_TYPE_BYTE = 'B';//byte
	public final char FILE_TYPE_KB = 'K';//kb
	public final char FILE_TYPE_MB = 'M';//Mb
	public final char FILE_TYPE_GB = 'G';//Gb
	public String FormetFileSize(File file) {//转换文件大小
		if(file == null) return "0B";
		long fileS = file.length();
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) + "G";
        }
        return fileSizeString;
    }

	/**
	 * 检查文件大小
	 * @param file
	 * @param fileLenth 文件限定大小长度
	 * @param type 长度类型,B|K|M|G
	 * @return
	 */
	public Boolean checkFileSize(File file,long fileLenth,char type){
		if(file == null) return true;
		Boolean flag = false;
		Long fileSize = file.length();
		switch (type) {
		case FILE_TYPE_BYTE:
			if(fileSize < fileLenth){
				flag = true;
			}
			break;
		case FILE_TYPE_KB:
			if(fileSize < Math.pow(1024,1) * fileLenth){
				flag = true;
			}
			break;
		case FILE_TYPE_MB:
			if(fileSize < Math.pow(1024,2) * fileLenth){
				flag = true;
			}
			break;
		case FILE_TYPE_GB:
			if(fileSize < Math.pow(1024,3) * fileLenth){
				flag = true;
			}
			break;
		default:
			break;
		}
		return flag;
	}
	/**
	 * 检查文件大小 单位M
	 * @param file
	 * @param fileSize
	 * @return
	 */
	public Boolean checkFileSizeByM(File file,double fileSize){
		return checkFileSize(file,(long)(fileSize),FILE_TYPE_MB);
	}
	/**
	 * 检查一组文件大小 单位M
	 * @param file
	 * @param fileSize
	 * @return
	 */
	public Boolean checkFileSizeByM(File[] files,double fileSize){
		return checkFileSize(files,(long)(fileSize),FILE_TYPE_MB);
	}
	/**
	 * 检查一组文件是否有超过大小的，有返回false
	 * @param files
	 * @param fileLenth 文件限定大小长度
	 * @param type 长度类型,B|K|M|G
	 * @return
	 */
	public Boolean checkFileSize(File[] files,long fileLenth,char type){
		if(files != null){
			for(File file : files){
				if(!checkFileSize(file,fileLenth,type)){
					return false;
				}
			}
		}
		return true;
	}
}
