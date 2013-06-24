package com.dotoyo.buildjob.sys.dao.impl;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysAdDao;
import com.dotoyo.buildjob.sys.dto.SysAdDto;

public class SysAdDaoImpl implements ISysAdDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysAdDto dto) {
		sqlMapClientTemplate.insert("addSysAd",dto);
	}

	public void remove(SysAdDto dto) {
		sqlMapClientTemplate.delete("removeSysAd",dto);
	}

	public SysAdDto search(SysAdDto dto) {
		return (SysAdDto)sqlMapClientTemplate.queryForObject("querySysAd", dto);
	}

	public List<SysAdDto> searchList(PageInfo pageInfo, SysAdDto dto) throws ParseException {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("startDate", dto.getStartDate());
		paraMap.put("endDate", dto.getEndDate());
		paraMap.put("company", dto.getCompany());
		paraMap.put("position", dto.getPosition());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysAdsCount", "querySysAdsList", paraMap);
	}

	public void update(SysAdDto dto) {
		sqlMapClientTemplate.update("updateSysAd",dto);
	}
	public void updateStatus(SysAdDto dto) {
		sqlMapClientTemplate.update("updateSysAdForStatus",dto);
	}
	
	/**
	 * 热门城市 企业加载
	 */
	@SuppressWarnings("unchecked")
	public List<SysAdDto> queryCitySiteHotEnterprises(SysAdDto dto){
		return sqlMapClientTemplate.queryForList("loadCitySiteHotEnterprises", dto);
	}
	
	/**
	 * 页面广告列表加载
	 * @param dto
	 */
	@SuppressWarnings("unchecked")
	public List<SysAdDto> queryAdForList(SysAdDto dto){
		return sqlMapClientTemplate.queryForList("loadingAds", dto);
	}
}
