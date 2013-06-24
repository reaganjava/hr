package test.com.dotoyo.buildjob.systemManage.service;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.systemManage.dto.FilterWordsDto;
import com.dotoyo.buildjob.systemManage.service.IFilterWordsService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description  
 * 
 */
public class FilterWordsServiceImplTest {

	private static AbstractApplicationContext tx = null;
	private static IFilterWordsService filterWordsService = null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		filterWordsService=(IFilterWordsService) tx.getBean("filterWordsService");
	}

	@Test
	public void testAddSensitiveWord() {
		FilterWordsDto filterWord = new FilterWordsDto();
		filterWord.setWords("胡锦涛");
		filterWord.setNotes("a");
		filterWord.setOperator(new Long(2));
		filterWordsService.addFilterWord(filterWord);
		
		Assert.assertTrue(filterWordsService.queryFilterWordsList().size()>0);
	}

	@Test
	public void testUpdateSensitiveWord() {
		FilterWordsDto filterWord = new FilterWordsDto();
		filterWord.setId(new Long(1));
		filterWord.setWords("江泽民");
		filterWord.setNotes("a");
		filterWord.setOperator(new Long(2));
		Assert.assertEquals(1, filterWordsService.updateFilterWord(filterWord));
	}

	@Test
	public void testQueryFilterWordsList() {
		Assert.assertTrue(filterWordsService.queryFilterWordsList().size()>0);
	}
	
	@Test
	public void testDeleteSensitiveWord() {
		Assert.assertEquals(1, filterWordsService.deleteFilterWords("1"));
	}

}
