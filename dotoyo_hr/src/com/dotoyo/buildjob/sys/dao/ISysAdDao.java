package com.dotoyo.buildjob.sys.dao;

import java.text.ParseException;
import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysAdDto;

/**
 * 广告维护
 * @author wisdy.xiao
 *
 */
public interface ISysAdDao {
	/**
	 * 增加广告
	 * @param dto
	 */
	public void add(SysAdDto dto);
	/**
	 * 删除广告
	 * @param dto
	 */
	public void remove(SysAdDto dto);
	/**
	 * 查询广告
	 * @param dto
	 * @return
	 */
	public SysAdDto search(SysAdDto dto);
	/**
	 * 查询广告list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysAdDto> searchList(PageInfo pageInfo,SysAdDto dto) throws ParseException;
	/**
	 * 更新广告
	 * @param dto
	 */
	public void update(SysAdDto dto);
	/**
	 * 更新状态
	 * @param dto
	 */
	public void updateStatus(SysAdDto dto);
	
	/**
	 * 页面广告列表加载
	 * @param dto
	 * @return
	 */
	public List<SysAdDto> queryAdForList(SysAdDto dto);

	/**
	 * 热门城市 企业加载
	 */
	public List<SysAdDto> queryCitySiteHotEnterprises(SysAdDto dto);
	
}
