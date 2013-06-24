package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementTalentsFoundOfflineSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务名称人才挖掘服务实现
 */
public class SysIncrementTalentsFoundOfflineSettingDaoImpl implements
	ISysIncrementTalentsFoundOfflineSettingDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public int addIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		sqlMapClientTemplate.insert("addIncrementTalentsFoundOfflineSetting", dto);
		return 1;
	}

	public SysIncrementTalentsFoundOfflineSettingDto queryIncrementTalentsFound(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return (SysIncrementTalentsFoundOfflineSettingDto)sqlMapClientTemplate.queryForObject("queryIncrementTalentsFoundOffline", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementTalentsFoundOfflineSettingDto> queryIncrementTalentsFoundList(
			PageInfo pageInfo,SysIncrementTalentsFoundOfflineSettingDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementTalentsFoundOfflineCount", "queryIncrementTalentsFoundOfflineList", paraMap);
	}

	public int removeIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementTalentsFoundOfflineSetting",dto);
	}

	public int updateIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sqlMapClientTemplate.update("updateIncrementTalentsFoundOfflineSetting", dto);
	}

}
