package test.com.dotoyo.buildjob.systemManage.service;

import java.util.Date;

import junit.framework.Assert;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.systemManage.dto.BackgroupMusicDto;
import com.dotoyo.buildjob.systemManage.service.IBackgroupMusicService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */
public class BackgroupMusicServiceImplTest {

	private static AbstractApplicationContext tx = null;
	private static IBackgroupMusicService backGroupMusicService = null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		backGroupMusicService=(IBackgroupMusicService) tx.getBean("backGroupMusicService");
	}
	
	@Test
	public void testAddBackgroupMusic() {
		BackgroupMusicDto backGroupMusic = new BackgroupMusicDto();
		backGroupMusic.setArticleid(new Long(1001));
		backGroupMusic.setUrl("http://www.1g1g.com/#510573");
		backGroupMusic.setStatus("open");
		backGroupMusic.setModifyDate(new Date());
		backGroupMusicService.addBackgroupMusic(backGroupMusic);
		
		Assert.assertEquals(new Long(1001), backGroupMusicService.queryBackgroupMustForList().get(0).getArticleid());
	}
	
	@Test
	public void testUpdateBackgroupMusicStatusById() {
		backGroupMusicService.updateBackgroupMusicStatusById(new Long(3), "close");
		Assert.assertEquals("close", backGroupMusicService.queryBackgroupMustForList().get(0).getStatus());
	}

	@Test
	public void testDeleteBackgroupMusic() {
		BackgroupMusicDto backGroupMusic = new BackgroupMusicDto();
		backGroupMusic.setId(new Long(3));
		Assert.assertEquals(1, backGroupMusicService.deleteBackgroupMusic(backGroupMusic));
	}

}
