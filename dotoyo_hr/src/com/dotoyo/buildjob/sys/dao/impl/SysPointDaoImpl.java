package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysPointDao;
import com.dotoyo.buildjob.sys.dto.SysPointDto;

public class SysPointDaoImpl implements ISysPointDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public SysPointDto search(String code) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", code);
		return (SysPointDto)sqlMapClientTemplate.queryForObject("querySysPoint", paraMap);
	}

	public List<SysPointDto> searchList(PageInfo pageInfo, String action) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("action", action);
		return PagingDataListUtil.getPagingData(pageInfo, "querySysPointCount", "querySysPointList", paraMap);
	}

	public void update(SysPointDto dto) {
		sqlMapClientTemplate.update("updateSysPoint",dto);
	}

	public List<LoginUserInfoDto> searchList(PageInfo pageInfo,
			String userName, String status,String point) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userName", userName);
		paraMap.put("status", status);
		paraMap.put("point", point);
		return PagingDataListUtil.getPagingData(pageInfo, "sysQueryMemberForListAccount", "sysQueryMemberForList", paraMap);
	}

	public void updateUserPoint(Long id, Long point) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", id);
		paraMap.put("point", point);
		sqlMapClientTemplate.update("updateSysUserPoint",paraMap);
	}

	public Long getPointValueByCode(String code) {
		return (Long) sqlMapClientTemplate.queryForObject("getPointValueByCode", code);
	}
}
