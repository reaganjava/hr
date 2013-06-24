package com.dotoyo.buildjob.systemManage.dao;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description 系统参数设置 
 * 
 */
public interface ISysParameterDao {
	/**
	 * 加载系统参数
	 */
	public List<SysParameterDto> querySysParameterForList();
	
	/**
	 * 系统参数修改
	 */
	public int updateSysParameter(SysParameterDto sysParameter);
	
	/**
	 * 设置系统参数值
	 */
	public void setSysParameterValue(String code,String sysValue);
	public SysParameterDto getSysParameterDtoBycode(String code);
}
