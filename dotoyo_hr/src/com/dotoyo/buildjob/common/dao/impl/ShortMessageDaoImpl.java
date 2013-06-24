package com.dotoyo.buildjob.common.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dao.IShortMessageDao;
import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.ibatis.sqlmap.client.SqlMapExecutor;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-20
 * @description
 */
public class ShortMessageDaoImpl implements IShortMessageDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void saveReceiveMsg(ShortMessageDto shortMessageDto) {
		sqlMapClientTemplate.insert("saveReceiveMsg", shortMessageDto);

	}

	public void saveBatchReceiveMsg(final List<ShortMessageDto> list) {
		try {
			if (list != null) {
				sqlMapClientTemplate.execute(new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor)
							throws SQLException {
						executor.startBatch();
						for (int i = 0, n = list.size(); i < n; i++) {
							executor.insert("saveReceiveMsg", list.get(i));
						}
						executor.executeBatch();
						return null;
					}
				});
			}
		} catch (Exception e) {

		}
	}

	public void deleteReceiveMsg(String ids) {
		sqlMapClientTemplate.delete("deleteReceiveMsg", ids);

	}

	@SuppressWarnings("unchecked")
	public List<ShortMessageDto> queryReceiveMsgList(PageInfo pageInfo,
			ShortMessageDto shortMessageDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryReceiveMsgCount", "queryReceiveMsgList", shortMessageDto);

	}

	public void updateReceiveMsgStatus(ShortMessageDto shortMessageDto) {
		sqlMapClientTemplate.update("updateReceiveMsgStatus", shortMessageDto);
	}

	public ShortMessageDto getReceiveMsgDetailById(Long id) {
		return (ShortMessageDto) sqlMapClientTemplate.queryForObject(
				"getReceiveMsgDetailById", id);
	}

	public void saveAutoShortMsgConfig(
			AutoShortMsgConfigDto autoShortMsgConfigDto) {
		sqlMapClientTemplate.insert("saveAutoShortMsgConfig",
				autoShortMsgConfigDto);

	}

	public void updateAutoShortMsgConfig(
			AutoShortMsgConfigDto autoShortMsgConfigDto) {
		sqlMapClientTemplate.update("updateAutoShortMsgConfig",
				autoShortMsgConfigDto);

	}

	public AutoShortMsgConfigDto getAutoShortMsgConfigByUserId(Long userId) {
		return (AutoShortMsgConfigDto) sqlMapClientTemplate.queryForObject(
				"getAutoShortMsgConfigByUserId", userId);
	}

	/**
	 * @return the sqlMapClientTemplate
	 */
	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	/**
	 * @param sqlMapClientTemplate
	 *            the sqlMapClientTemplate to set
	 */
	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

}
