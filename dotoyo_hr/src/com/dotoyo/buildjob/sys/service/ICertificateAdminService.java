package com.dotoyo.buildjob.sys.service;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.common.dto.PageInfo;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-22
 * @description
 */
public interface ICertificateAdminService {
	public List<CertNeedsDto> queryCertNeedsList4Admin(PageInfo pageInfo,
			Map<String, String> certNeedsMap);

	public Integer queryCertNeedsCount4Admin(Map<String, String> certNeedsMap);

	public CertNeedsDto getCertNeedsById4Admin(Long id);

	public void editIndeedStatus(Map<String, String> certNeedsMap);

	public List<PersonalCertDto> queryPersonalCertList4Admin(PageInfo pageInfo,
			Map<String, String> personalCertMap);

	public Integer queryPersonalCertCount4Admin(
			Map<String, String> personalCertMap);

	public PersonalCertDto getPersonalCertById4Admin(Long id);

	public Integer getCertNeedsCount();

	public Integer getPersonalCertCount();

}
