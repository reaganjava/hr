package com.dotoyo.buildjob.common.service;

/**
 * 沙龙相关联删除操作
 * @author wisdy.xiao
 *
 */
public interface IDataOperationService {
	/**
	 * 删除沙龙
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removeSalonByIds(Object [] arrayIds) throws Exception;
	/**
	 * 删除文章
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removeArticleByIds(Object []arrayIds)throws Exception;
	/**
	 * 删除视频
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removeVedioMediaByIds(Object []arrayIds)throws Exception;
	/**
	 * 删除图片
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removePictureMediaByIds(Object []arrayIds)throws Exception;
	/**
	 * 删除评论
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removeCommentsByIds(Object []arrayIds)throws Exception;
	/**
	 * 删除沙龙下所有视频
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removeVediosMediaBySalon(Object [] arrayIds) throws Exception;
	/**
	 * 删除沙龙下所有图片
	 * @param arrayIds
	 * @throws Exception
	 */
	public void removePicturesMediaBySalon(Object [] arrayIds) throws Exception;
}
