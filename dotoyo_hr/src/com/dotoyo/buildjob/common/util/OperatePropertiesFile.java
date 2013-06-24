package com.dotoyo.buildjob.common.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;


/**
 * Operate properties file, including to write and read properties file.
 * 
 */
public class OperatePropertiesFile {

	/**
	 * The log4j object.
	 */
	private static Logger log = Logger.getLogger(OperatePropertiesFile.class);

	/**
	 * The default constructor.
	 */
	public OperatePropertiesFile() {

	}

	/**
	 * Read value by key from properties file.
	 * 
	 * @param filePath
	 * @param key
	 * @return
	 */
	public String readValue(String filePath, String key) throws Exception {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			String value = props.getProperty(key);
			log.info(key + value);
			return value;
		} catch (Exception e) {
			log.error("", e);
			throw e;
			// return null;
		}
	}

	/**
	 * Read all values from properties file.
	 * 
	 * @param filePath
	 */
	public Map<String, String> readProperties() throws Exception {
		Properties props = new Properties();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String classPath = PathUtil.getPathFromClass(this.getClass());
			classPath = classPath.replaceAll("%20", " ");
			classPath = classPath.substring(0, classPath.indexOf("WEB-INF"));
			System.out.println("classPath:" + classPath);
			String separator = System.getProperty("file.separator");
			String filePath = classPath + "WEB-INF" + separator + "classes"
					+ separator + "applicationProperties.properties";
			System.out.println("filepath:" + filePath);
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			Enumeration<?> en = props.propertyNames();
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				String value = props.getProperty(key);
				map.put(key, value);
				log.info(key + ":" + value);
			}
			return map;
		} catch (Exception e) {
			log.error("", e);
			throw e;
			// return map;
		}
	}

	/**
	 * Write value of key to properties file.
	 * 
	 * @param filePath
	 * @param key
	 * @param value
	 */
	public void writeProperties(String filePath, String key, String value)
			throws Exception {
		Properties prop = new Properties();
		try {
			InputStream fis = new FileInputStream(filePath);
			prop.load(fis);

			OutputStream fos = new FileOutputStream(filePath);
			prop.setProperty(key, value);
			prop.store(fos, "Update '" + key + "' value");
		} catch (IOException e) {
			log.error("", e);
			throw e;
		}
	}

	/**
	 * Testing method.
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			OperatePropertiesFile opf = new OperatePropertiesFile();
			String filePath = "D:\\Program\\Apache Software Foundation\\Tomcat 6.0\\webapps\\AGH_ERP\\WEB-INF\\classes\\Properties\\ApplicationProperties.properties";
			opf.readValue(filePath, "ReportServerIP");
			opf.writeProperties(filePath, "ReportServerPort", "8080");
			opf.readProperties();
			System.out.println("OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
