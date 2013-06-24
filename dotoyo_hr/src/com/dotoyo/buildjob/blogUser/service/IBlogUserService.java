package com.dotoyo.buildjob.blogUser.service;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;

public interface IBlogUserService {
	public void saveBlogUserInfo(BlogUserInfoDto blogUserInfoDto);

	public BlogUserInfoDto getBlogUserInfoDetailByUserName(String userName);

	public void updateBlogUserInfo(BlogUserInfoDto blogUserInfoDto);
}
