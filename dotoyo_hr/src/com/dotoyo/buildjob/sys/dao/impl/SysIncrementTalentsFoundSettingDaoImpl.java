package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementTalentsFoundSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务名称人才挖掘服务实现
 */
public class SysIncrementTalentsFoundSettingDaoImpl implements
	ISysIncrementTalentsFoundSettingDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public int addIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundSettingDto dto) {
		sqlMapClientTemplate.insert("addIncrementTalentsFoundSetting", dto);
		return 1;
	}

	public SysIncrementTalentsFoundSettingDto queryIncrementTalentsFound(
			SysIncrementTalentsFoundSettingDto dto) {
		return (SysIncrementTalentsFoundSettingDto)sqlMapClientTemplate.queryForObject("queryIncrementTalentsFound", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementTalentsFoundSettingDto> queryIncrementTalentsFoundList(
			PageInfo pageInfo,SysIncrementTalentsFoundSettingDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementTalentsFoundCount", "queryIncrementTalentsFoundList", paraMap);
	}

	public int removeIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundSettingDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementTalentsFoundSetting",dto);
	}

	public int updateIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundSettingDto dto) {
		return sqlMapClientTemplate.update("updateIncrementTalentsFoundSetting", dto);
	}

}
