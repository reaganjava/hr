package test.com.dotoyo.buildjob;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.danga.MemCached.MemCachedClient;

/**
 * @author tyler.qu
 * @dateCreated 2011-3-1
 * @description
 * 
 */
public class Memcache {
	public static void main(String[] args) {

		String[] app = {"applicationContext*.xml"};
		AbstractApplicationContext tx = new ClassPathXmlApplicationContext(app);
		
		MemCachedClient mc = (MemCachedClient) tx.getBean("memcachedClient");
		
		for (int i = 0; i < 100; i++) {
			mc.set("keya" + i, "value" + i);
		}
		try {
			Thread.sleep(5000);
		} catch (Exception e) {
		}
		
		System.out.println(mc.keyExists("keya2"));
		
		
		
		/*for (int i = 0; i < 100; i++) {
			System.out.println("get " + i + " value " + mc.get("keya" + i));
		}*/
	}
}
