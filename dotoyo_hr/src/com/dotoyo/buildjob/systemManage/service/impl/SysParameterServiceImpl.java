package com.dotoyo.buildjob.systemManage.service.impl;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dao.ISysParameterDao;
import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;
import com.dotoyo.buildjob.systemManage.service.ISysParameterService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */
public class SysParameterServiceImpl implements ISysParameterService {
	private ISysParameterDao sysParameterDao;
	
	public List<SysParameterDto> querySysParameterForList() {
		return sysParameterDao.querySysParameterForList();
	}

	public int updateSysParameter(SysParameterDto sysParameter) {
		return sysParameterDao.updateSysParameter(sysParameter);
	}

	public void setSysParameterValue(String code,String sysValue){
		sysParameterDao.setSysParameterValue(code, sysValue);
	}
	public SysParameterDto getSysParameterDtoBycode(String code){
		return sysParameterDao.getSysParameterDtoBycode(code);
	}
	
	public void setSysParameterDao(ISysParameterDao sysParameterDao) {
		this.sysParameterDao = sysParameterDao;
	}

	public ISysParameterDao getSysParameterDao() {
		return sysParameterDao;
	}

}
