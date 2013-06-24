package test.com.dotoyo.buildjob.common.user.service;


import java.util.Date;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.common.paymentonline.PaymentDto;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.Md5;
import com.dotoyo.buildjob.common.vo.SearchPaymentVo;

/**
 * @author tyler.qu
 * @dateCreated 2010-11-29
 * @description  
 * 
 */
public class UserServiceTest {

	private static AbstractApplicationContext tx = null;
	private static IUserService userService = null;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		String[] app = {"applicationContext*.xml"};
		tx = new ClassPathXmlApplicationContext(app);
		
		userService=(IUserService) tx.getBean("userService");
	}
	
	//@Test
	public void testAddUser(){
		LoginUserInfoDto userInfo = new LoginUserInfoDto();
		userInfo.setUserName("coco@dotoyo.com");
		userInfo.setPassword(Md5.encoderByMd5("123456"));
		userService.addUser(userInfo);
		Assert.assertEquals("coco@dotoyo.com",userService.getUserByUserNameAndPassword(userInfo.getUserName(), userInfo.getPassword()).getUserName()); 
	}
	
	@Test
	public void testQueryMemberList(){
		Assert.assertTrue(userService.queryMemberList().size()>=0);
	}
	
	@Test
	public void testGetUserById(){
		Assert.assertEquals("coco@dotoyo.com", userService.getUserById(new Long(1)).getUserName());
	}
	
	@Test
	public void testSearchMemberList(){
		Assert.assertEquals("coco@dotoyo.com", userService.searchMemberList("dotoyo").get(0).getUserName());
	}
	
	@Test
	public void testUpdateUser(){
		LoginUserInfoDto userInfo = new LoginUserInfoDto();
		userInfo.setId(new Long(1));
		userInfo.setPassword(Md5.encoderByMd5("456789"));
		userInfo.setPoint(new Long(10));
		
	}
	
	@Test
	public void testDeletePaymentRecordById(){
		Assert.assertEquals(new Long(1), new Long(userService.deletePaymentRecordById(new Long(1))));
	}
	
	@Test
	public void testAddPaymentRecord(){
		PaymentDto paymentRecord = new PaymentDto();
		paymentRecord.setPayer(new Long(1));
		paymentRecord.setAmount(new Double(10.0));
		paymentRecord.setStatus("0");
		paymentRecord.setNotes("申请成为第三类付费用户！");
		userService.addPaymentRecord(paymentRecord);
		
		Assert.assertEquals(new Long(1), userService.queryPaymentList().get(0).getPayer());
	}
	
	@Test
	public void testSaveConfirmPayment(){
		PaymentDto paymentRecord = new PaymentDto();
		paymentRecord.setId(new Long(3));
		
		paymentRecord.setConfirmMan(new Long(1));
		paymentRecord.setNotes("申请成为第二类付费用户！");
		Assert.assertEquals(new Integer(1), new Integer(userService.saveConfirmPayment(paymentRecord)));
	}
	
	@Test
	public void testSearchPaymentList(){
		SearchPaymentVo searchVo = new SearchPaymentVo();
		searchVo.setUserName("dotoyo");
		searchVo.setStartSubmitDate(DateUtil.addDate(new Date(),-5));
		searchVo.setEndSubmitDate(new Date());
		searchVo.setStartConfirmDate(DateUtil.addDate(new Date(),-5));
		searchVo.setEndConfirmDate(new Date());
		searchVo.setStatus("0");
		
		Assert.assertTrue(userService.searchPaymentList(searchVo).size()>0);
	}
	
}
