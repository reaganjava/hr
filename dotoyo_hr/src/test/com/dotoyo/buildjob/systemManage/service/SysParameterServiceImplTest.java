package test.com.dotoyo.buildjob.systemManage.service;

import junit.framework.Assert;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;
import com.dotoyo.buildjob.systemManage.service.impl.SysParameterServiceImpl;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */
public class SysParameterServiceImplTest {

	private static AbstractApplicationContext tx = null;
	private static SysParameterServiceImpl sysParameterService = null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		sysParameterService=(SysParameterServiceImpl) tx.getBean("sysParameterService");
	}

	@Test
	public void testQuerySysParameterForList() {
		Assert.assertEquals("10001", sysParameterService.querySysParameterForList().get(0).getCode());
	}

	@Test
	public void testUpdateSysParameter() {
		SysParameterDto sysParameter = new SysParameterDto();
		sysParameter.setId(new Long(1));
		sysParameter.setName("线下人才推荐申请审批");
		sysParameter.setNotes("申请成为线下推荐人才");
		sysParameter.setSysValue("ok");
		
		Assert.assertEquals(1, sysParameterService.updateSysParameter(sysParameter));
	}

}
