package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementHangCardSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementHangCardSettingDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务挂证服务实现
 */
public class SysIncrementHangCardSettingDaoImpl implements
	ISysIncrementHangCardSettingDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public int addIncrementHangCardSetting(
			SysIncrementHangCardSettingDto dto) {
		sqlMapClientTemplate.insert("addIncrementHangCardSetting", dto);
		return 1;
	}

	public SysIncrementHangCardSettingDto queryIncrementHangCard(
			SysIncrementHangCardSettingDto dto) {
		return (SysIncrementHangCardSettingDto)sqlMapClientTemplate.queryForObject("queryIncrementHangCard", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementHangCardSettingDto> queryIncrementHangCardList(
			PageInfo pageInfo,SysIncrementHangCardSettingDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementHangCardCount", "queryIncrementHangCardList", paraMap);
	}

	public int removeIncrementHangCardSetting(
			SysIncrementHangCardSettingDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementHangCardSetting",dto);
	}

	public int updateIncrementHangCardSetting(
			SysIncrementHangCardSettingDto dto) {
		return sqlMapClientTemplate.update("updateIncrementHangCardSetting", dto);
	}

}
