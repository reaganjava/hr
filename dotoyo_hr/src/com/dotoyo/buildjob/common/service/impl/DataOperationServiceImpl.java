package com.dotoyo.buildjob.common.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.service.IDataOperationService;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonManageService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonSearchService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;
import com.dotoyo.buildjob.sys.service.ISalonAdminService;
import com.dotoyo.buildjob.systemManage.service.ISysParameterService;

public class DataOperationServiceImpl implements IDataOperationService {
	private ISalonSearchService salonSearchService;
	private ISalonService salonService;
	private ISalonAdminService salonAdminService;
	private ISalonManageService salonManageService;
	private ISysParameterService sysParameterService;

	public void removeArticleByIds(Object[] arrayIds) throws Exception {
		//search related comments and delete
		List<String> commentsIds = new ArrayList<String>();

		for(Object id : arrayIds){
			List<CommentDto> commentlist =  salonService.querySalonCommentList(null, Long.valueOf(id.toString()), ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE, null);
			for(CommentDto comment : commentlist){
				commentsIds.add(String.valueOf(comment.getId()));
			}
		}
		//delete comments
		if(commentsIds != null && commentsIds.size() > 0){
			String arrcommentsids = StringUtils.join(commentsIds.toArray(),",");
			this.salonManageService.deleteComment(arrcommentsids);
		}


		if(arrayIds != null && arrayIds.length > 0){
			String ids = StringUtils.join(arrayIds,",");
			//delete online pictures or videos
			this.salonAdminService.deleteMediasByArticleId(ids);
			//delete articles
			this.salonManageService.deleteArticle(ids);
		}

	}

	public void removeCommentsByIds(Object[] arrayIds) throws Exception {
		if(arrayIds != null && arrayIds.length > 0){
			String arrcommentsids = StringUtils.join(arrayIds,",");
			this.salonManageService.deleteComment(arrcommentsids);
		}

	}

	public void removeVedioMediaByIds(Object[] arrayIds) throws Exception {
		Object [] commentsIds = getCommentArrayBySubjectIdAndType(arrayIds,ApplicationConstant.COMMENT_SUBJECT_TYPE_VIDEO);
		//delete comments
		if(commentsIds != null && commentsIds.length > 0){
			removeCommentsByIds(commentsIds);
		}
		//delete vedios
		if(arrayIds != null && arrayIds.length > 0){
			String ids = StringUtils.join(arrayIds,",");
			this.salonManageService.deleteMedia(ids);
		}

	}
	public void removePictureMediaByIds(Object[] arrayIds) throws Exception {
		Object [] commentsIds = getCommentArrayBySubjectIdAndType(arrayIds,ApplicationConstant.COMMENT_SUBJECT_TYPE_PICTURE);
		//delete comments
		if(commentsIds != null && commentsIds.length > 0){
			removeCommentsByIds(commentsIds);
		}
		//delete vedios
		if(arrayIds != null && arrayIds.length > 0){
			String ids = StringUtils.join(arrayIds,",");
			this.salonManageService.deleteMedia(ids);
		}

	}
	public void removeSalonByIds(Object[] arrayIds) throws Exception {
		Object [] commentsIds = getCommentArrayBySubjectIdAndType(arrayIds,ApplicationConstant.COMMENT_SUBJECT_TYPE_SALON);
		//delete comments
		if(commentsIds != null && commentsIds.length > 0){
			removeCommentsByIds(commentsIds);
		}

		List<Long> picturelist = new ArrayList<Long>();
		List<Long> vediolist = new ArrayList<Long>();
		List<Long> articlelist = new ArrayList<Long>();
		for(Object salonId : arrayIds){
			List<SalonMediaDto> medialist = salonSearchService.querySalonMediaListBySalonId(null, Long.valueOf(salonId.toString()), null);
			for(SalonMediaDto tmp : medialist){
				//图片
				if(ApplicationConstant.MEDIA_TYPE_PICTURE.equals(tmp.getMediaType())){
					picturelist.add(tmp.getId());
				//视频
				}else{
					vediolist.add(tmp.getId());
				}
			}
			//delete articles
			SalonSearchVo salonSearchVo = new SalonSearchVo();
			salonSearchVo.setSalonId(Long.valueOf(salonId.toString()));
			List<SalonArticleDto> articles = salonSearchService.querySalonArticleList(null, salonSearchVo);
			for(SalonArticleDto tmp : articles){
				articlelist.add(tmp.getId());
			}
		}
		//delete pictures
		removePictureMediaByIds(picturelist.toArray());
		//delete vedios
		removeVedioMediaByIds(vediolist.toArray());
		//delete articles
		removeArticleByIds(articlelist.toArray());
		//delete salons
		if(arrayIds != null && arrayIds.length > 0){
			String ids = StringUtils.join(arrayIds,",");
			this.salonService.deleteSalon(ids);
		}


	}
	public void removePicturesMediaBySalon(Object [] arrayIds) throws Exception{
		List<Long> picturelist = new ArrayList<Long>();
		for(Object salonId : arrayIds){
			List<SalonMediaDto> medialist = salonSearchService.querySalonMediaListBySalonId(null, Long.valueOf(salonId.toString()), ApplicationConstant.MEDIA_TYPE_PICTURE);
			for(SalonMediaDto tmp : medialist){
				picturelist.add(tmp.getId());

			}
		}
		//delete pictures
		removePictureMediaByIds(picturelist.toArray());
	}
	public void removeVediosMediaBySalon(Object [] arrayIds) throws Exception{
		List<Long> vediolist = new ArrayList<Long>();
		for(Object salonId : arrayIds){
			List<SalonMediaDto> medialist = salonSearchService.querySalonMediaListBySalonId(null, Long.valueOf(salonId.toString()), ApplicationConstant.MEDIA_TYPE_VIDEO);
			for(SalonMediaDto tmp : medialist){
				vediolist.add(tmp.getId());
			}
		}
		//delete vedios
		removeVedioMediaByIds(vediolist.toArray());
	}
	/**
	 * Get comments id array.
	 * @param arrayIds
	 * @param type
	 * @return
	 */
	private Object[] getCommentArrayBySubjectIdAndType(Object[] arrayIds,String type){
		List<String> commentsIds = new ArrayList<String>();
		for(Object id : arrayIds){
			List<CommentDto> commentlist =  salonService.querySalonCommentList(null, Long.valueOf(id.toString()), type, null);
			for(CommentDto comment : commentlist){
				commentsIds.add(String.valueOf(comment.getId()));
			}
		}
		return commentsIds.toArray();
	}
	public ISalonSearchService getSalonSearchService() {
		return salonSearchService;
	}

	public void setSalonSearchService(ISalonSearchService salonSearchService) {
		this.salonSearchService = salonSearchService;
	}

	public ISalonService getSalonService() {
		return salonService;
	}

	public void setSalonService(ISalonService salonService) {
		this.salonService = salonService;
	}

	public ISalonAdminService getSalonAdminService() {
		return salonAdminService;
	}

	public void setSalonAdminService(ISalonAdminService salonAdminService) {
		this.salonAdminService = salonAdminService;
	}

	public ISalonManageService getSalonManageService() {
		return salonManageService;
	}

	public void setSalonManageService(ISalonManageService salonManageService) {
		this.salonManageService = salonManageService;
	}

	public ISysParameterService getSysParameterService() {
		return sysParameterService;
	}

	public void setSysParameterService(ISysParameterService sysParameterService) {
		this.sysParameterService = sysParameterService;
	}

	public void removeCommentsByIds(String[] arrayIds) throws Exception {
		// TODO Auto-generated method stub

	}


}
