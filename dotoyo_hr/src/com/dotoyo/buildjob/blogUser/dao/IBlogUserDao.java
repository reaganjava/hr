package com.dotoyo.buildjob.blogUser.dao;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;

public interface IBlogUserDao {
	public void saveBlogUserInfo(BlogUserInfoDto blogUserInfoDto);

	public BlogUserInfoDto getBlogUserInfoDetailByUserName(String userName);

	public void updateBlogUserInfo(BlogUserInfoDto blogUserInfoDto);
}
