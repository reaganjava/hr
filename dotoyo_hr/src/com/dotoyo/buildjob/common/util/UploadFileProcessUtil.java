package com.dotoyo.buildjob.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;

/**
 * file process
 *
 * @author Bill xu
 *
 */
public class UploadFileProcessUtil {
	/**
	 * Enforce Singleton pattern.
	 */

	private static final Integer BUFFER_SIZE = 1024;

	public UploadFileProcessUtil() {
	}

	/***************************************************************************
	 * Set Upload File(single file)
	 **************************************************************************/
	public static String uploadFile(File uploadFile, String uploadFileName) {

		String newFileName = "";
		int fileNameLength=50;

		if (uploadFile != null) {
			File rootDir;
			String folder = "";
			try {
				folder = PropertiesValue.getPropertyValue("uploadFilePath");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			String fileRealName;
			String fileName;
			String fileEx;

			String separator = System.getProperty("file.separator");

//			folder = ServletActionContext.getServletContext().getRealPath(
//					separator + "uploadFile");
//
//			fileName = uploadFileName.substring(0,
//					uploadFileName.lastIndexOf("."));
			fileEx = uploadFileName
					.substring(uploadFileName.lastIndexOf(".") + 1);
			rootDir = new File(folder);
			if (!rootDir.exists())
				rootDir.mkdirs();

//			fileName += String.valueOf(new Date().getTime());
//			fileName = StringUtils.right(fileName, fileNameLength);//控制文件名长度
			fileName = StringUtil.newInstance().createIdTwenty(); ///生成随机图片名
			fileRealName = folder + separator + fileName + "." + fileEx;
			newFileName = fileName + "." + fileEx;

			try {
				copy(uploadFile, new File(fileRealName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return newFileName;
	}

	/***************************************************************************
	 * Set Upload File(single file or more files)
	 **************************************************************************/

	public static List<SalonMediaDto> uploadFiles(File[] uploadFiles,String[] uploadFilesName,String[] fileSubjects,File[] uploadCoverFiles,String[] uploadCoverFilesName) {

		ArrayList<SalonMediaDto> fileInfoList = new ArrayList<SalonMediaDto>();

		if (uploadFiles != null && uploadFiles.length > 0) {
			File rootDir;
			String folder = "";
			try {
				folder = PropertiesValue.getPropertyValue("uploadFilePath");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			String fileRealName;
			String fileName;
			String fileEx;
			for (int i = 0; i < uploadFiles.length; i++) {
				SalonMediaDto salonMediaDto = new SalonMediaDto();
				if (uploadFilesName[i] != null
						&& !uploadFilesName[i].equals("")) {
					String separator = System.getProperty("file.separator");
/*
					folder = ServletActionContext.getServletContext()
							.getRealPath(
									separator + "Upload" + separator
											+ "Document");
	*/
//					fileName = uploadFilesName[i].substring(0,
//							uploadFilesName[i].lastIndexOf("."));
					fileEx = uploadFilesName[i].substring(uploadFilesName[i]
							.lastIndexOf(".") + 1);
					rootDir = new File(folder);

					if (!rootDir.exists())
						rootDir.mkdirs();
					fileName = String.valueOf(new Date().getTime());
					fileRealName = folder + separator + fileName + "." + fileEx;
					try {
						copy(uploadFiles[i], new File(fileRealName));
						//处理视频封面图片
						if(uploadCoverFiles!=null && uploadCoverFiles.length>0){
							salonMediaDto.setVideoCoverPic(uploadFile(uploadCoverFiles[i],uploadCoverFilesName[i]));
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					salonMediaDto.setMediaName(fileName+"."+fileEx);
					salonMediaDto.setSubject(fileSubjects[i]);
					fileInfoList.add(salonMediaDto);
				}
			}
		}
		return fileInfoList;
	}

	private static void copy(File src, File dst) throws Exception {
		InputStream in = null;
		OutputStream out = null;

		in = new BufferedInputStream(new FileInputStream(src));
		out = new BufferedOutputStream(new FileOutputStream(dst));
		byte[] buffer = new byte[BUFFER_SIZE];
		for (int byteRead = 0; (byteRead = in.read(buffer)) > 0;) {
			out.write(buffer, 0, byteRead);
		}
		in.close();
		out.close();
	}

}