/**
 * 
 */
package test.com.dotoyo.buildjob.certificateCenter.service;

import java.util.Date;

import junit.framework.Assert;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.CollectCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.certificateCenter.vo.CollectCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-1
 * @description
 */
/**
 * @author arthas.zou
 * 
 */
public class CertificateServiceTest {

	private static AbstractApplicationContext tx = null;
	private static ICertificateService certificateService = null;

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = { "applicationContext*.xml" };
		tx = new ClassPathXmlApplicationContext(app);
		certificateService = (ICertificateService) tx
				.getBean("certificateService");
	}

	/**
	 * Test method for
	 * {@link com.dotoyo.buildjob.certificateCenter.service.impl.CertificateServiceImpl#savePersonalCert(com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto)}
	 * .
	 */
	@Test
	public void testSavePersonalCertificate() {
		PageInfo pageInfo = new PageInfo();
		PersonalCertDto personalCertDto = new PersonalCertDto();
		personalCertDto.setCertStatus("未挂靠");
		personalCertDto.setAreaCode("福田区");
		personalCertDto.setCellPhone("18666218641");
		personalCertDto.setCertCode("1001-1001");
		personalCertDto.setRegisterStatusCode("未注册");
		personalCertDto.setCityCode("深圳市");
		personalCertDto.setContact("Arthas Zou");
		personalCertDto.setDescp("This is a test.");
		personalCertDto.setSubmitDate(new Date());
		personalCertDto.setLastEditDate(new Date());
		personalCertDto.setEmail("zxz3777689@163.com");
		personalCertDto.setFax("18666218641");
		personalCertDto.setProvinceCode("广东省");
		personalCertDto.setSpecialFieldCode("CS");
		personalCertDto.setTelephone("18666218641");
		personalCertDto.setUserId(new Long(1));
		int sizeBefore = certificateService.queryPersonalCertPaginatedList(
				pageInfo, personalCertDto).size();
		certificateService.savePersonalCert(personalCertDto,
				new LoginUserInfoDto());
		int sizeAfter = certificateService.queryPersonalCertPaginatedList(
				pageInfo, personalCertDto).size();
		Assert.assertTrue(sizeAfter > sizeBefore);
	}

	/**
	 * Test method for
	 * {@link com.dotoyo.buildjob.certificateCenter.service.impl.CertificateServiceImpl#saveCertNeeds(com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto)}
	 * .
	 */
	@Test
	public void testSaveCertNeeds() {
		PageInfo pageInfo = new PageInfo();
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		certNeedsDto.setAreaCode("福田区");
		certNeedsDto.setCellPhone("18666218641");
		certNeedsDto.setCertCode("1001-1001");
		certNeedsDto.setCertNeedsAmount(10);
		certNeedsDto.setRegisterStatusCode("未注册");
		certNeedsDto.setCityCode("深圳市");
		certNeedsDto.setContact("Arthas Zou");
		certNeedsDto.setDescp("This is a test.");
		certNeedsDto.setEffDate(new Date());
		certNeedsDto.setEmail("zxz3777689@163.com");
		certNeedsDto.setExpDate(new Date());
		certNeedsDto.setFax("123456789");
		certNeedsDto.setIsIndeed("N");
		certNeedsDto.setProvinceCode("广东省");
		certNeedsDto.setSpecialFieldCode("CS");
		certNeedsDto.setTelephone("18666218641");
		certNeedsDto.setUserId(new Long(1));
		certNeedsDto.setSubmitDate(new Date());
		certNeedsDto.setLastEditDate(new Date());
		certNeedsDto.setCertNeedsStatus("未注册");
		int sizeBefore = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto).size();
		certificateService.saveCertNeeds(certNeedsDto, new LoginUserInfoDto());
		int sizeAfter = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto).size();
		Assert.assertTrue(sizeAfter > sizeBefore);

	}

	/**
	 * Test method for
	 * {@link com.dotoyo.buildjob.certificateCenter.service.impl.CertificateServiceImpl#queryPersonalCertList(com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto)}
	 * .
	 */
	@Test
	public void testQueryPersonalCertificateList() {
		PageInfo pageInfo = new PageInfo();
		PersonalCertDto personalCertDto = new PersonalCertDto();
		int size = certificateService.queryPersonalCertPaginatedList(pageInfo,
				personalCertDto).size();
		Assert.assertTrue(size > 0);
	}

	/**
	 * Test method for
	 * {@link com.dotoyo.buildjob.certificateCenter.service.impl.CertificateServiceImpl#queryCertNeedsList(com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto)}
	 * .
	 */
	@Test
	public void testQueryCertNeedsList() {
		PageInfo pageInfo = new PageInfo();
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		int size = certificateService.queryCertNeedsPaginatedList(pageInfo,
				certNeedsDto).size();
		Assert.assertTrue(size > 0);
	}

	/**
	 * Test method for
	 * {@link com.dotoyo.buildjob.certificateCenter.service.impl.CertificateServiceImpl#getPersonalCertById(int)}
	 * .
	 */
	@Test
	public void testGetPersonalCertificateById() {
		Long id = new Long(1);
		Long testID = certificateService.getPersonalCertById(id).getId();
		Assert.assertEquals(id, testID);
	}

	/**
	 * Test method for
	 * {@link com.dotoyo.buildjob.certificateCenter.service.impl.CertificateServiceImpl#getCertNeedsById(int)}
	 * .
	 */
	@Test
	public void testGetCertNeedsById() {
		Long id = new Long(1);
		Long testID = certificateService.getCertNeedsById(id).getId();
		Assert.assertEquals(id, testID);
	}

	@Test
	public void testUpdateCertNeeds() {
		PageInfo pageInfo = new PageInfo();
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		CertNeedsVo updateVo = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto).get(0);
		Long id = updateVo.getId();
		Date dateBefore = updateVo.getLastEditDate();
		updateVo.setLastEditDate(new Date());
		CertNeedsDto updateDto = new CertNeedsDto();
		updateDto.setCellPhone(updateVo.getCellPhone());
		updateDto.setCertCode(updateVo.getCert().getCode());
		updateDto.setCertNeedsAmount(updateVo.getCertNeedsAmount());
		updateDto.setCertNeedsStatus(updateVo.getCertNeedsStatus());
		updateDto.setCityCode(updateVo.getCity().getCode());
		updateDto.setContact(updateVo.getContact());
		updateDto.setDescp(updateVo.getDescp());
		updateDto.setEffDate(updateVo.getEffDate());
		updateDto.setEmail(updateVo.getEmail());
		updateDto.setExpDate(updateVo.getExpDate());
		updateDto.setFax(updateVo.getFax());
		updateDto.setId(updateVo.getId());
		updateDto.setIsIndeed(updateVo.getIsIndeed());
		updateDto.setLastEditDate(updateVo.getLastEditDate());
		updateDto.setProvinceCode(updateVo.getProvince().getCode());
		updateDto.setRegisterStatusCode(updateVo.getRegisterStatus().getCode());
		updateDto.setSpecialFieldCode(updateVo.getSpecialField().getCode());
		updateDto.setSubmitDate(updateVo.getSubmitDate());
		updateDto.setTelephone(updateVo.getTelephone());
		updateDto.setUserId(updateVo.getUserId());
		certificateService.updateCertNeeds(updateDto);
		Date dateAfter = certificateService.getCertNeedsById(id)
				.getLastEditDate();
		Assert.assertNotSame(dateBefore, dateAfter);
	}

	@Test
	public void TestDeleteCertNeeds() {
		PageInfo pageInfo = new PageInfo();
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		CertNeedsVo deleteVo = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto).get(0);
		Long id = deleteVo.getId();
		int sizeBefore = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto).size();
		String ids = id.toString();
		certificateService.deleteCertNeeds(ids);
		int sizeAfter = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto).size();
		Assert.assertTrue(sizeBefore - sizeAfter == 1);
	}

	@Test
	public void testUpdatePersonalCert() {
		PageInfo pageInfo = new PageInfo();
		PersonalCertDto personalCertDto = new PersonalCertDto();
		PersonalCertVo updateVo = certificateService
				.queryPersonalCertPaginatedList(pageInfo, personalCertDto).get(
						0);
		Long id = updateVo.getId();
		Date dateBefore = updateVo.getLastEditDate();
		updateVo.setLastEditDate(new Date());
		PersonalCertDto updateDto = new PersonalCertDto();
		updateDto.setAreaCode(updateVo.getArea().getCode());
		updateDto.setCellPhone(updateVo.getCellPhone());
		updateDto.setCertCode(updateVo.getCert().getCode());
		updateDto.setCertStatus(updateVo.getCertStatus());
		updateDto.setCityCode(updateVo.getCity().getCode());
		updateDto.setContact(updateVo.getContact());
		updateDto.setDescp(updateVo.getDescp());
		updateDto.setEmail(updateVo.getEmail());
		updateDto.setFax(updateVo.getFax());
		updateDto.setId(updateVo.getId());
		updateDto.setLastEditDate(updateVo.getLastEditDate());
		updateDto.setProvinceCode(updateVo.getProvince().getCode());
		updateDto.setRegisterStatusCode(updateVo.getRegisterStatus().getCode());
		updateDto.setSpecialFieldCode(updateVo.getSpecialField().getCode());
		updateDto.setSubmitDate(updateVo.getSubmitDate());
		updateDto.setTelephone(updateVo.getTelephone());
		updateDto.setUserId(updateVo.getUserId());
		certificateService.updatePersonalCert(updateDto);
		Date dateAfter = certificateService.getPersonalCertById(id)
				.getLastEditDate();
		Assert.assertNotSame(dateBefore, dateAfter);
	}

	@Test
	public void testDeletePersonalCert() {
		PageInfo pageInfo = new PageInfo();
		PersonalCertDto personalCertDto = new PersonalCertDto();
		PersonalCertVo deleteVo = certificateService
				.queryPersonalCertPaginatedList(pageInfo, personalCertDto).get(
						0);
		Long id = deleteVo.getId();
		int sizeBefore = certificateService.queryPersonalCertPaginatedList(
				pageInfo, personalCertDto).size();
		String ids = id.toString();
		certificateService.deletePersonalCert(ids);
		int sizeAfter = certificateService.queryPersonalCertPaginatedList(
				pageInfo, personalCertDto).size();
		Assert.assertTrue(sizeBefore - sizeAfter == 1);
	}

	@Test
	public void testSaveCollectCert() {
		Long collectorID = new Long(1);
		CollectCertDto collectCertDto = new CollectCertDto();
		collectCertDto.setCollectDate(new Date());
		collectCertDto.setCollectorID(collectorID);
		collectCertDto.setPersonalCertID(new Long(1));
		int sizeBefore = certificateService.queryCollectCertList(collectorID)
				.size();
		certificateService.saveCollectCert(collectCertDto);
		int sizeAfter = certificateService.queryCollectCertList(collectorID)
				.size();
		Assert.assertTrue(sizeAfter - sizeBefore == 1);
	}

	@Test
	public void testQueryCollectCertList() {
		Long collectorID = new Long(1);
		int size = certificateService.queryCollectCertList(collectorID).size();
		Assert.assertTrue(size > 0);
	}

	@Test
	public void testGetCollectCertById() {
		Long id = new Long(1);
		CollectCertVo collectCertVo = certificateService.getCollectCertById(id);
		Assert.assertEquals(id, collectCertVo.getId());
	}

	@Test
	public void testDeleteCollectCert() {
		Long collectorID = new Long(1);
		CollectCertVo deleteVo = certificateService.queryCollectCertList(
				collectorID).get(0);
		Long id = deleteVo.getId();
		int sizeBefore = certificateService.queryCollectCertList(collectorID)
				.size();
		certificateService.deleteCollectCert(id);
		int sizeAfter = certificateService.queryCollectCertList(collectorID)
				.size();
		Assert.assertTrue(sizeBefore - sizeAfter == 1);
	}

}
