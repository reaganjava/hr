package com.dotoyo.buildjob.blogUser.service.impl;

import com.dotoyo.buildjob.blogUser.dao.IBlogUserDao;
import com.dotoyo.buildjob.blogUser.service.IBlogUserService;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;

public class BlogUserServiceImpl implements IBlogUserService {
	private IBlogUserDao blogUserDao;

	public void saveBlogUserInfo(BlogUserInfoDto blogUserInfoDto) {
		// TODO Auto-generated method stub

	}

	public BlogUserInfoDto getBlogUserInfoDetailByUserName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateBlogUserInfo(BlogUserInfoDto blogUserInfoDto) {
		blogUserDao.updateBlogUserInfo(blogUserInfoDto);

	}

	public IBlogUserDao getBlogUserDao() {
		return blogUserDao;
	}

	public void setBlogUserDao(IBlogUserDao blogUserDao) {
		this.blogUserDao = blogUserDao;
	}

}
