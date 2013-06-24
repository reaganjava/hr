package com.dotoyo.buildjob.systemManage.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.systemManage.dao.ISysParameterDao;
import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description 
 * 
 */
public class SysParameterDaoImpl implements ISysParameterDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@SuppressWarnings("unchecked")
	public List<SysParameterDto> querySysParameterForList() {
		return sqlMapClientTemplate.queryForList("querySysParameterForList");
	}

	public int updateSysParameter(SysParameterDto sysParameter) {
		return sqlMapClientTemplate.update("updateSysParameter", sysParameter);
	}

	public void setSysParameterValue(String code,String sysValue) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("code", code);
		paraMap.put("sysValue", sysValue);
		sqlMapClientTemplate.update("setSysParameterValue", paraMap);
	}

	public SysParameterDto getSysParameterDtoBycode(String code) {
		return (SysParameterDto)sqlMapClientTemplate.queryForObject("getSysParameterDtoBycode",code);
	}
	
	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

}
