package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysIncrementServiceNameMaintainanceDao;
import com.dotoyo.buildjob.sys.dto.IncrementServiceDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementServiceNameMaintainanceDto;
/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务名称维护实现
 */
public class SysIncrementServiceNameMaintainanceDaoImpl implements
		ISysIncrementServiceNameMaintainanceDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	public int addIncrementServiceName(
			SysIncrementServiceNameMaintainanceDto dto) {
		sqlMapClientTemplate.insert("addIncrementServiceName", dto);
		return 1;
	}

	public SysIncrementServiceNameMaintainanceDto queryIncrementSerivceName(
			SysIncrementServiceNameMaintainanceDto dto) {
		return (SysIncrementServiceNameMaintainanceDto)sqlMapClientTemplate.queryForObject("queryIncrementSerivceName",dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysIncrementServiceNameMaintainanceDto> queryIncrementSerivceNameList(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sqlMapClientTemplate.queryForList("queryIncrementSerivceNameList",dto);
	}
	public List<SysIncrementServiceNameMaintainanceDto> queryIncrementSerivceNameList(
			PageInfo pageInfo,SysIncrementServiceNameMaintainanceDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("serviceName", dto.getServiceName());
		return PagingDataListUtil.getPagingData(pageInfo, "queryIncrementSerivceNameCount", "queryIncrementSerivceNameListByMap", paraMap);
	}
	public int removeIncrementSerivceNameByCode(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sqlMapClientTemplate.delete("removeIncrementSerivceNameByCode", dto);
	}

	public int updateIncrementSerivceName(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sqlMapClientTemplate.update("updateIncrementSerivceName", dto);
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public List<IncrementServiceDto> queryHeadHunterServiceList(
			PageInfo pageInfo, IncrementServiceDto dto) {
		return PagingDataListUtil.getPagingData(pageInfo, "queryHeadHunterServiceCount", "queryHeadHunterServiceList", dto);
	}

}
