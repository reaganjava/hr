package com.dotoyo.buildjob.common.util;

import com.danga.MemCached.MemCachedClient;

/**
 * @author tyler.qu
 * @dateCreated 2011-3-1
 * @description  
 * 
 */
public class CacheManager {
	private static MemCachedClient memcachedClient;
	
	private CacheManager(){}
	
	public static MemCachedClient getInstanceMemcachedClient(){
		return memcachedClient;
	}

	public void setMemcachedClient(MemCachedClient memcachedClient) {
		CacheManager.memcachedClient = memcachedClient;
	}

	public MemCachedClient getMemcachedClient() {
		return memcachedClient;
	}
}
