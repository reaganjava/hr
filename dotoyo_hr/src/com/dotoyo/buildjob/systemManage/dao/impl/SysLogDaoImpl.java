package com.dotoyo.buildjob.systemManage.dao.impl;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.systemManage.dao.ISysLogDao;
import com.dotoyo.buildjob.systemManage.dto.SysLogDto;

public class SysLogDaoImpl implements ISysLogDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	public void addSysLog(SysLogDto dto) {
		sqlMapClientTemplate.insert("addSysLog",dto);
	}

	public List<SysLogDto> querySysLogList(PageInfo pageInfo, SysLogDto dto) throws ParseException {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("operatorName", dto.getOperatorName());
		paraMap.put("operatorTime", dto.getOperate_time());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysLogCount", "querySysLogList", paraMap);
	}

	public void removeSysLog(Long id) {
		SysLogDto dto = new SysLogDto();
		dto.setId(id);
		sqlMapClientTemplate.delete("removeSysLogById",dto);
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

}
