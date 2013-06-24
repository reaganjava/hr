package test.com.dotoyo.buildjob.headhunterCenter;

import java.util.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-5
 * @description  
 * 
 */
public class JobInfoServiceImplTest {

	private static AbstractApplicationContext tx = null;
	private static IJobInfoService jobInfoService = null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		jobInfoService=(IJobInfoService) tx.getBean("jobInfoService");
	}

	@Test
	public void testReleasedNumberOfThePostsToDay(){
		PageInfo pageInfo = null;
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(11);
		List<JobSearchVo> jL = jobInfoService.queryJobApplicantsStatistics(DateUtil.addDate(new Date(), -30), DateUtil.addDate(new Date(),10),null);
		int sumEmploy=0;
		int sumRecruitingNumber=0;
		for (JobSearchVo jobSearchVo : jL) {
			sumEmploy+=jobSearchVo.getEmploy();
			sumRecruitingNumber+=jobSearchVo.getRecruitingNumber();
		}
		System.out.println(sumEmploy+"---->"+sumRecruitingNumber);
	}
	
	/*@Test
	public void testQuerySysJobInformation(){
		JobSearchVo jobSearchVo = new JobSearchVo();
		jobSearchVo.setStatus("");
		jobSearchVo.setJobIssuetDate(DateUtil.addDate(new Date(), -20));
		jobSearchVo.setJobExpiryDate(DateUtil.addDate(new Date(), 30));
		jobSearchVo.setJobName("");
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		
		System.out.println(jobInfoService.querySysJobInformation(jobSearchVo, pageInfo).size());
	}
	
	@Test
	public void testAddJobInfo() {
		fail("Not yet implemented");
	}

	@Test
	public void testSearchRecommentEnterpriseList() {
		fail("Not yet implemented");
	}

	//@Test
	public void testSearchJobForList() {
		JobSearchVo jobSearchVo = new JobSearchVo();
		jobSearchVo.setIndustryType("001-01-1002");
		jobSearchVo.setProvinceCode("140000");
		jobSearchVo.setCityCode("141100");
		jobSearchVo.setAreaCode("141121");
		jobSearchVo.setCompetency("002-1024");
		jobSearchVo.setKeyWord("江苏");
		jobSearchVo.setSpecializedType("003-1002-1005");
		jobSearchVo.setSearchType("1");
		jobSearchVo.setIsAdviser("1");
		jobSearchVo.setJobIssuetDate(DateUtil.addDate(new Date(), -7));
		jobSearchVo.setWorkingLife("006-1001");
		jobSearchVo.setJobNature("005-1001");
		jobSearchVo.setEducation("007-1001");
		
		List<JobInfoDto> jList = jobInfoService.searchJobForList(jobSearchVo);
		Assert.assertTrue(jList.size()>0);
	}

	//@Test
	public void testGetJobInfoById() {
		JobInfoDto jobInfo = jobInfoService.getJobInfo(new Long(3), new Long(2));
		Assert.assertTrue(jobInfo.getRecruitingNumber()==11);
	}

	@Test
	public void testAddAppliedJobRecord() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryAppliedJobRecordListByUserId() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddFavoritedJobRecord() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryUserJobadfavorites() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddRecommendedPosts() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryUserReceivableRecommendedPosts() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddJobInfoTemplate() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryJobTemplates() {
		fail("Not yet implemented");
	}

	//@Test
	public void testQueryCompetencyJobs() {
		List <JobInfoDto> jobList = jobInfoService.queryCompetencyJobs(ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_BUILDER, "005-1001", null,ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT);
		for (JobInfoDto jobInfoDto : jobList) {
			System.out.println(jobInfoDto);
		}
		Assert.assertTrue(jobList.size()>0);
	}
	
	//@Test
	public void testQueryRecommentEnterpriseJobList(){
		List <JobInfoDto> jobList = jobInfoService.queryRecommentEnterpriseJobList(new Long(1));
		for (JobInfoDto jobInfoDto : jobList) {
			System.out.println(jobInfoDto);
		}
		Assert.assertTrue(jobList.size()>0);
	}
	
	@Test
	public void testQueryJobListByIndustryId(){
		@SuppressWarnings("unchecked")
		List <JobInfoDto> jobList = (List<JobInfoDto>) jobInfoService.queryJobListByIndustryId("001-01-1002").get("resultList");
		for (JobInfoDto jobInfoDto : jobList) {
			System.out.println(jobInfoDto);
		}
		Assert.assertTrue(jobList.size()>0);
	}
	
	//@Test
	public void testLoadEJobInfo(){
		JobInfoDto jobList = jobInfoService.loadEJobInfo(new Long(58), new Long(1001));
		System.out.println(jobList);
	}*/
}
