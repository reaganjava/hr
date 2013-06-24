package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.sys.dto.SysPointDto;
/**
 * 积分设置维护
 * @author wisdy.xiao
 *
 */
public interface ISysPointService {
	/**
	 * 查询积分设置
	 * @param dto
	 * @return
	 */
	public SysPointDto search(String code);
	/**
	 * 查询积分设置list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysPointDto> searchList(PageInfo pageInfo,String action);
	/**
	 * 更新积分设置
	 * @param dto
	 */
	public void update(SysPointDto dto);
	/**
	 * 更新用户积分
	 * @param dto
	 */
	public void updateUserPoint(Long id,Long point);

	/**
	 * 查询用户List
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<LoginUserInfoDto> searchList(PageInfo pageInfo,String userName,String status,String point);
	
	/**
	 * 根据code获取积分值
	 * @param code
	 */
	public Long getPointValueByCode(String code);
}
