package com.dotoyo.buildjob.common.util;

import java.util.HashMap;
import java.util.Map;

public class PropertiesValue {

	private static Map<String, String> propertiesValueMap = new HashMap<String, String>();

	/**
	 * Single state method. Getting report server configuration map.
	 * 
	 * @return
	 * @throws Exception
	 */
	private static Map<String, String> getPropertiesValueMap() throws Exception {
		try {
			if (propertiesValueMap == null
					|| propertiesValueMap.isEmpty()) {
				setPropertiesValueMap(new OperatePropertiesFile()
						.readProperties());
			}
			return propertiesValueMap;
		} catch (Exception e) {
			throw e;
		}
	}

	public static void setPropertiesValueMap(Map<String, String> map) {
		propertiesValueMap = map;
	}

	/**
	 * Get property value according to the inputting key.
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static String getPropertyValue(String key) throws Exception {
		try {
			return String.valueOf(getPropertiesValueMap().get(key));
		} catch (Exception e) {
			throw e;
		}
	}

	public static String getPropertyValueByKey(String key){
		   String keyValue =null;
			try {
				keyValue = String.valueOf(getPropertiesValueMap().get(key));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return keyValue;
	}


	

}
