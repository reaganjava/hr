package test.com.dotoyo.buildjob.applyJobCenter.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.applyJobCenter.vo.ApplyJobInfoVo;
import com.dotoyo.buildjob.applyJobCenter.vo.RecommendationVo;
import com.dotoyo.buildjob.common.dto.PageInfo;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-3
 * @description
 */
public class ApplyJobServiceTest {

	private static AbstractApplicationContext tx = null;
	private static IApplyJobService applyJobService = null;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = { "applicationContext*.xml" };
		tx = new ClassPathXmlApplicationContext(app);
		applyJobService = (IApplyJobService) tx.getBean("applyJobService");
	}

	// @Test
	public void testDeleteLineTalentById(){
		applyJobService.deleteLineTalentById("1001,1");
	}

	@Test
	public void testUpdateLineTalentVerifyStatus(){
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("id", "3");
		paramMap.put("verifyStatus", "0");
		paramMap.put("lastEditDate", new Date());
		applyJobService.updateLineTalentVerifyStatus(paramMap);
	}
	
	/*@Test
	public void testSaveApplyJobInfo() {
		PageInfo pageInfo = new PageInfo();
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		applyJobInfoDto.setAreaCode("福田区");
		applyJobInfoDto.setCityCode("深圳市");
		Date submitDate = new Date();
		applyJobInfoDto.setSubmitDate(submitDate);
		applyJobInfoDto.setLastEditDate(submitDate);
		applyJobInfoDto.setFunctionCode("给排水工程师");
		applyJobInfoDto.setIsAdvisor("Y");
		applyJobInfoDto.setJobTypeCode("全职");
		applyJobInfoDto.setExpectedPosition("position");
		applyJobInfoDto.setProvinceCode("广东省");
		applyJobInfoDto.setUserId(new Long(1));
		applyJobInfoDto.setExpectedSalaryCode("");
		applyJobInfoDto.setActStatus("A");
		int sizeBefore = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto).size();
		applyJobService.saveApplyJobInfo(applyJobInfoDto, "N");
		int sizeAfter = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto).size();
		Assert.assertTrue(sizeAfter - sizeBefore == 1);
	}

	@Test
	public void testQueryApplyJobInfoList() {
		PageInfo pageInfo = new PageInfo();
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		int size = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto).size();
		Assert.assertTrue(size > 0);
	}

	@Test
	public void testGetApplyJobInfoById() {
		Long id = new Long(1);
		ApplyJobInfoDto applyJobInfoDto = applyJobService.getApplyJobInfoById(
				id).convertToDto();
		Assert.assertEquals(id, applyJobInfoDto.getId());
	}

	@Test
	public void testUpdateApplyJobInfo() {
		PageInfo pageInfo = new PageInfo();
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		ApplyJobInfoVo updateVo = applyJobService.queryApplyJobInfoList(
				pageInfo, applyJobInfoDto).get(0);
		Long id = updateVo.getId();
		Date dateBefore = updateVo.getLastEditDate();
		updateVo.setLastEditDate(new Date());
		ApplyJobInfoDto updateDto = new ApplyJobInfoDto();
		updateDto.setActStatus(updateVo.getActStatus());
		updateDto.setAreaCode(updateVo.getArea().getCode());
		updateDto.setCityCode(updateVo.getCity().getCode());
		updateDto.setExpectedPosition(updateVo.getExpectedPosition());
		updateDto.setExpectedSalaryCode(updateVo.getExpectedSalary().getCode());
		updateDto.setFunctionCode(updateVo.getFunction().getCode());
		updateDto.setId(id);
		updateDto.setIsAdvisor(updateVo.getIsAdvisor());
		updateDto.setJobTypeCode(updateVo.getJobType().getCode());
		updateDto.setLastEditDate(new Date());
		updateDto.setProvinceCode(updateVo.getProvince().getCode());
		updateDto.setSubmitDate(updateVo.getSubmitDate());
		updateDto.setUserId(updateVo.getUserId());
		applyJobService.updateApplyJobInfo(updateDto);
		applyJobInfoDto.setId(id);
		Date dateAfter = applyJobService
				.queryApplyJobInfoList(pageInfo, applyJobInfoDto).get(0)
				.getLastEditDate();
		Assert.assertNotSame(dateBefore, dateAfter);
	}

	@Test
	public void testDeleteApplyJobInfo() {
		PageInfo pageInfo = new PageInfo();
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		List<ApplyJobInfoVo> applyJobInfoListBefore = applyJobService
				.queryApplyJobInfoList(pageInfo, applyJobInfoDto);
		Long id = applyJobInfoListBefore.get(0).getId();
		applyJobService.deleteApplyJobInfo(id);
		applyJobInfoDto.setId(id);
		List<ApplyJobInfoVo> applyJobInfoListAfter = applyJobService
				.queryApplyJobInfoList(pageInfo, applyJobInfoDto);
		Assert.assertTrue(applyJobInfoListAfter.isEmpty());
	}

	@Test
	public void testSaveRecommendation() {
		RecommendationDto recommendationDto = new RecommendationDto();
		recommendationDto.setAreaCode("福田区");
		recommendationDto.setCityCode("深圳市");
		Date submitDate = new Date();
		recommendationDto.setSubmitDate(submitDate);
		recommendationDto.setLastEditDate(submitDate);
		recommendationDto.setExpectedPosition("Position Name");
		recommendationDto.setFunctionCode("function name");
		recommendationDto.setIsAdvisor("Y");
		recommendationDto.setExpectedSalaryCode("10000以上");
		recommendationDto.setJobTypeCode("全职");
		recommendationDto.setProvinceCode("广东省");
		recommendationDto.setVerifyStatus("0");
		recommendationDto.setRecommendationType("0");
		recommendationDto.setUserId(new Long(1));

		int sizeBefore = applyJobService.queryRecommendationList(
				recommendationDto).size();
		applyJobService.saveRecommendation(recommendationDto, "N");
		int sizeAfter = applyJobService.queryRecommendationList(
				recommendationDto).size();
		Assert.assertTrue(sizeAfter - sizeBefore == 1);
	}

	@Test
	public void testQueryRecommendationList() {
		RecommendationDto recommendationDto = new RecommendationDto();
		List<RecommendationVo> dtoList = applyJobService
				.queryRecommendationList(recommendationDto);
		Assert.assertTrue(!dtoList.isEmpty());
	}

	@Test
	public void testGetRecommendationById() {
		Long id = new Long(1);
		RecommendationVo recommendationVo = applyJobService
				.getRecommendationById(id);
		Assert.assertEquals(id, recommendationVo.getId());
	}

	@Test
	public void testUpdateRecommendation() {
		RecommendationDto recommendationDto = new RecommendationDto();
		RecommendationDto updateDto = applyJobService
				.queryRecommendationList(recommendationDto).get(0)
				.convertToDto();
		Long id = updateDto.getId();
		Date dateBefore = updateDto.getLastEditDate();
		updateDto.setLastEditDate(new Date());
		applyJobService.updateRecommendation(updateDto);
		updateDto = applyJobService.getRecommendationById(id).convertToDto();
		Date dateAfter = updateDto.getLastEditDate();
		Assert.assertNotSame(dateBefore, dateAfter);
	}

	@Test
	public void testDeleteRecommendation() {
		RecommendationDto recommendationDto = new RecommendationDto();
		RecommendationDto deleteDto = applyJobService
				.queryRecommendationList(recommendationDto).get(0)
				.convertToDto();
		Long id = deleteDto.getId();
		int sizeBefore = applyJobService.queryRecommendationList(
				recommendationDto).size();
		applyJobService.deleteRecommendation(id);
		int sizeAfter = applyJobService.queryRecommendationList(
				recommendationDto).size();
		Assert.assertTrue(sizeBefore - sizeAfter == 1);
	}
*/
}
