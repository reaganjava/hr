package test.com.dotoyo.buildjob.peopleExcavate;

import static org.junit.Assert.fail;
import junit.framework.Assert;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.peopleExcavate.service.IPeopleExcavateService;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-15
 * @description  
 * 
 */
public class PeopleExcavateTest {

	private static AbstractApplicationContext tx = null;
	private static IPeopleExcavateService peopleExcavateService = null;
	private static IUserService userService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		peopleExcavateService=(IPeopleExcavateService) tx.getBean("peopleExcavateService");
		userService = (IUserService) tx.getBean("userService");
	}
	
	@Test
	public void testQueryLineTalentPool(){
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		BlogUserInfoDto blogUserInfo = new BlogUserInfoDto();
		blogUserInfo.setUserName("xm");
		blogUserInfo.setCompanyName("永正");
		userService.queryRecruiterInformation(pageInfo,	blogUserInfo);
	}
	
	//@Test
	public void testGetCountOFEnterprise() {
		Assert.assertTrue(peopleExcavateService.getCountOFEnterprise()>1);
	}

	//@Test
	public void testGetCountOfPersonnel() {
		Assert.assertTrue(peopleExcavateService.getCountOfPersonnel()>1);
	}

	//@Test
	public void testQueryTalentShowStarTOP_N() {
		Assert.assertTrue(peopleExcavateService.getTalentShowStarTOP_N(10).size()==10);
	}

	//@Test
	public void testQueryTalentSearch() {
		/**
		 * AND userInfo.industryType='001-01-1002'
    AND userInfo.specializedType='003-1002-1005'
    AND userInfo.competency='002-1024'
    AND userInfo.provinceCode='140000'
    AND userInfo.cityCode='141100'
    AND userInfo.areaCode='141121'
    AND userInfo.expertise='工程设计'
    AND userInfo.education='007-1001'
    AND userInfo.workingLife='006-1001'
    AND userInfo.age='29'
    AND userInfo.sex='1'
    AND userInfo.langCapa='008-1001'
    AND userInfo.mastery='009-1001'             
    AND userInfo.computerGrade='011-1001'      
    AND userInfo.isAdviser='1'          
    AND userInfo.jobNature='005-1001'          
    AND userInfo.userInfoUpdateDate='0000-00-00 00:00:00'
    AND userInfo.categoryIndex='3'      
    AND userInfo.jobKeyWord='工程师'
		 */
		
		PeopleExcavateVo peopleExcavateVo = new PeopleExcavateVo();
		peopleExcavateVo.setIndustryType("001-01-1002");
		peopleExcavateVo.setSpecializedType("003-1002-1005");
		peopleExcavateVo.setCompetency("002-1024");
		peopleExcavateVo.setProvinceCode("140000");
		peopleExcavateVo.setCityCode("141100");
		peopleExcavateVo.setAreaCode("141121");
		peopleExcavateVo.setEducation("007-1001");
		peopleExcavateVo.setWorkingLife("006-1001");
		peopleExcavateVo.setAge("29");
		peopleExcavateVo.setCategoryIndex("3");
		Assert.assertTrue(peopleExcavateService.queryTalentList(peopleExcavateVo).size()>2);
	}

	//@Test
	public void testQueryBtiTalentSearch() {
		fail("Not yet implemented");
	}

	public static void setUserService(IUserService userService) {
		PeopleExcavateTest.userService = userService;
	}

	public static IUserService getUserService() {
		return userService;
	}

}
