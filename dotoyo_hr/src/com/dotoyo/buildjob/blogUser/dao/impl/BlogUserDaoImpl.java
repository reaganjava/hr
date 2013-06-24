package com.dotoyo.buildjob.blogUser.dao.impl;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.blogUser.dao.IBlogUserDao;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;

public class BlogUserDaoImpl implements IBlogUserDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void saveBlogUserInfo(BlogUserInfoDto blogUserInfoDto) {
		// TODO Auto-generated method stub

	}

	public BlogUserInfoDto getBlogUserInfoDetailByUserName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public void updateBlogUserInfo(BlogUserInfoDto blogUserInfoDto) {
		sqlMapClientTemplate.update("updateBlogUserInfo", blogUserInfoDto);

	}

}
