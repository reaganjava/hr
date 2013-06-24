package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementAdvertSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementAdvertSettingDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务广告位服务实现
 */
public class SysIncrementAdvertSettingDaoImpl implements
	ISysIncrementAdvertSettingDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public int addIncrementAdvertSetting(
			SysIncrementAdvertSettingDto dto) {
		sqlMapClientTemplate.insert("addIncrementAdvertSetting", dto);
		return 1;
	}

	public SysIncrementAdvertSettingDto queryIncrementAdvert(
			SysIncrementAdvertSettingDto dto) {
		return (SysIncrementAdvertSettingDto)sqlMapClientTemplate.queryForObject("queryIncrementAdvert", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementAdvertSettingDto> queryIncrementAdvertList(
			PageInfo pageInfo,SysIncrementAdvertSettingDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementAdvertCount", "queryIncrementAdvertList", paraMap);
	}

	public int removeIncrementAdvertSetting(
			SysIncrementAdvertSettingDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementAdvertSetting",dto);
	}

	public int updateIncrementAdvertSetting(
			SysIncrementAdvertSettingDto dto) {
		return sqlMapClientTemplate.update("updateIncrementAdvertSetting", dto);
	}

}
