package test.com.dotoyo.buildjob.systemManage.service;

import junit.framework.Assert;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;
import com.dotoyo.buildjob.systemManage.service.IClassMasterService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-3
 * @description  
 * 
 */
public class ClassMasterServiceImplTest {

	private static AbstractApplicationContext tx = null;
	private static IClassMasterService classMasterService = null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		classMasterService=(IClassMasterService) tx.getBean("classMasterService");
	}

	@Test
	public void testAddClassMaster() {
		ClassMasterDto classMasterDto = new ClassMasterDto();
		classMasterDto.setId(new Long(99999));
		classMasterDto.setCode("005-1003");
		classMasterDto.setName("专职");
		classMasterDto.setParentCode("005");
		classMasterService.addClassMaster(classMasterDto);
		
		Assert.assertEquals("专职", classMasterService.queryClassMasterListOfClassMaster(classMasterDto).get(2).getName());
	}
	
	@Test
	public void testUpdateClassMaster() {
		ClassMasterDto classMasterDto = new ClassMasterDto();
		classMasterDto.setId(new Long(99999));
		classMasterDto.setCode("005-1003");
		classMasterDto.setName("专职工作");
		classMasterDto.setParentCode("005");
		classMasterService.updateClassMaster(classMasterDto);
		
		Assert.assertEquals("专职工作", classMasterService.queryClassMasterListOfClassMaster(classMasterDto).get(2).getName());
	}
	
	@Test
	public void testQueryClassMasterList() {
		Assert.assertTrue(classMasterService.queryClassMasterList().size()>10);
	}

	@Test
	public void testQueryClassMasterListOfClassMaster() {
		ClassMasterDto classMasterDto = new ClassMasterDto();
		classMasterDto.setId(new Long(99999));
		classMasterDto.setCode("005-1003");
		classMasterDto.setName("专职工作");
		classMasterDto.setParentCode("005");
		Assert.assertTrue(classMasterService.queryClassMasterListOfClassMaster(classMasterDto).size()>1);
	}

	@Test
	public void testDeleteClassMasterById(){
		ClassMasterDto classMasterDto = new ClassMasterDto();
		classMasterDto.setId(new Long(99999));
		Assert.assertEquals(1, classMasterService.deleteClassMasterById(new Long(99999)));
	}
	
	@Test
	public void testGenerateClassMasterCode(){
		
		Assert.assertEquals("099-1001", classMasterService.generateClassMasterCode("099"));
	}

}
