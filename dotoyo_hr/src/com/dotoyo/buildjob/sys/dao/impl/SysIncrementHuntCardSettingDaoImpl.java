package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementHuntCardSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementHuntCardSettingDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务猎证服务实现
 */
public class SysIncrementHuntCardSettingDaoImpl implements
	ISysIncrementHuntCardSettingDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public int addIncrementHuntCardSetting(
			SysIncrementHuntCardSettingDto dto) {
		sqlMapClientTemplate.insert("addIncrementHuntCardSetting", dto);
		return 1;
	}

	public SysIncrementHuntCardSettingDto queryIncrementHuntCard(
			SysIncrementHuntCardSettingDto dto) {
		return (SysIncrementHuntCardSettingDto)sqlMapClientTemplate.queryForObject("queryIncrementHuntCard", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementHuntCardSettingDto> queryIncrementHuntCardList(
			PageInfo pageInfo,SysIncrementHuntCardSettingDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementHuntCardCount", "queryIncrementHuntCardList", paraMap);
	}

	public int removeIncrementHuntCardSetting(
			SysIncrementHuntCardSettingDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementHuntCardSetting",dto);
	}

	public int updateIncrementHuntCardSetting(
			SysIncrementHuntCardSettingDto dto) {
		return sqlMapClientTemplate.update("updateIncrementHuntCardSetting", dto);
	}

}
