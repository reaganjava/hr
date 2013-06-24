package com.dotoyo.buildjob.personalCenter.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.personalCenter.dto.FilterCompanyDto;
import com.dotoyo.buildjob.personalCenter.service.IFilterCompanyService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-25
 * @description
 */
public class FilterCompanyAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5442596590341736325L;
	private IFilterCompanyService filterCompanyService;
	private FilterCompanyDto filterCompanyDto;
	public HttpServletRequest request = null;
	private String actionMessage;

	/**
	 * 当前登陆用户查看自己的屏蔽公司信息
	 * 
	 * @return
	 */
	public String viewFilterCompany4LogginUser() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		filterCompanyDto = filterCompanyService
				.getFilterCompanyByUserId(userId);
		if (filterCompanyDto == null) {
			filterCompanyDto = new FilterCompanyDto();
			filterCompanyDto.setUserId(userId);
			filterCompanyService.SaveFilterCompany(filterCompanyDto);
			filterCompanyDto = filterCompanyService
					.getFilterCompanyByUserId(userId);
		}
		return "viewFilterCompany4LogginUser";
	}

	public String updateFilterCompany() {
		filterCompanyService.updateFilterCompany(filterCompanyDto);
		actionMessage = "保存成功";
		return viewFilterCompany4LogginUser();
	}

	/**
	 * @return the filterCompanyService
	 */
	public IFilterCompanyService getFilterCompanyService() {
		return filterCompanyService;
	}

	/**
	 * @param filterCompanyService
	 *            the filterCompanyService to set
	 */
	public void setFilterCompanyService(
			IFilterCompanyService filterCompanyService) {
		this.filterCompanyService = filterCompanyService;
	}

	/**
	 * @return the filterCompanyDto
	 */
	public FilterCompanyDto getFilterCompanyDto() {
		return filterCompanyDto;
	}

	/**
	 * @param filterCompanyDto
	 *            the filterCompanyDto to set
	 */
	public void setFilterCompanyDto(FilterCompanyDto filterCompanyDto) {
		this.filterCompanyDto = filterCompanyDto;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

}
