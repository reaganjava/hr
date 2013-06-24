package com.dotoyo.buildjob.systemManage.service;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */
public interface ISysParameterService {
	/**
	 * 加载系统参数
	 */
	public List<SysParameterDto> querySysParameterForList();
	
	/**
	 * 系统参数修改
	 */
	public int updateSysParameter(SysParameterDto sysParameter);
	
	public void setSysParameterValue(String code,String sysValue);
	public SysParameterDto getSysParameterDtoBycode(String code);
	
}
