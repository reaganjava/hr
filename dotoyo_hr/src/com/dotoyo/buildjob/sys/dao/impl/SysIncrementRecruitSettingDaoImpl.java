package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementRecruitSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementRecruitSettingDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务挂证服务实现
 */
public class SysIncrementRecruitSettingDaoImpl implements
	ISysIncrementRecruitSettingDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public int addIncrementRecruitSetting(
			SysIncrementRecruitSettingDto dto) {
		sqlMapClientTemplate.insert("addIncrementRecruitSetting", dto);
		return 1;
	}

	public SysIncrementRecruitSettingDto queryIncrementRecruit(
			SysIncrementRecruitSettingDto dto) {
		return (SysIncrementRecruitSettingDto)sqlMapClientTemplate.queryForObject("queryIncrementRecruit", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementRecruitSettingDto> queryIncrementRecruitList(
			PageInfo pageInfo,SysIncrementRecruitSettingDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementRecruitCount", "queryIncrementRecruitList", paraMap);
	}

	public int removeIncrementRecruitSetting(
			SysIncrementRecruitSettingDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementRecruitSetting",dto);
	}

	public int updateIncrementRecruitSetting(
			SysIncrementRecruitSettingDto dto) {
		return sqlMapClientTemplate.update("updateIncrementRecruitSetting", dto);
	}

}
