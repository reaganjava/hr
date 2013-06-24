package com.dotoyo.buildjob.common.util;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapExecutor;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-25
 * @description
 *
 */
public class IbatisBatchOperation {
	private static SqlMapClientTemplate sqlMapClientTemplate;

	public static void batchUpdate( final String statementName, final List<Object> list) {
	       try {
	           if (list != null ) {
	              sqlMapClientTemplate.execute( new SqlMapClientCallback() {
	                  public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
	                     executor.startBatch();
	                     for ( int i = 0, n = list.size(); i < n; i++) {
	                         executor.update(statementName, list.get(i));
	                     }
	                     executor.executeBatch();
	                     return null ;
	                  }
	              });
	           }
	       } catch (Exception e) {
	              e.printStackTrace();
	       }
	    }
	    public static void batchInsert( final String statementName, final List<Object> list) {
	       try {
	           if (list != null ) {
	              sqlMapClientTemplate.execute( new SqlMapClientCallback() {
	                  public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
	                     executor.startBatch();
	                     for ( int i = 0, n = list.size(); i < n; i++) {
	                         executor.insert(statementName, list.get(i));
	                     }
	                     executor.executeBatch();
	                     return null ;
	                  }
	              });
	           }
	       } catch (Exception e) {
	              e.printStackTrace();
	       }

	    }
	    public static void batchDelete( final String statementName, final List<Object> list) {
	       try {
	           if (list != null ) {
	              sqlMapClientTemplate.execute( new SqlMapClientCallback() {
	                  public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
	                     executor.startBatch();
	                     for ( int i = 0, n = list.size(); i < n; i++) {
	                         executor.delete(statementName, list.get(i));
	                     }
	                     executor.executeBatch();
	                     return null ;
	                  }
	              });
	           }
	       } catch (Exception e) {
	              e.printStackTrace();
	       }
	    }
		public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
			IbatisBatchOperation.sqlMapClientTemplate = sqlMapClientTemplate;
		}
		public SqlMapClientTemplate getSqlMapClientTemplate() {
			return sqlMapClientTemplate;
		}
}
