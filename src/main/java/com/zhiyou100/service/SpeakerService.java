package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Speaker;

public interface SpeakerService {

	/**
	 * 增加主讲人
	 * @param speaker
	 */
	void saveSpeaker(Speaker speaker);
	
	
	/**
	 * 编辑主讲人
	 * @param speaker
	 */
	void updateSpeaker(Speaker speaker);
	
	/**
	 * 删除主讲人
	 * @param id 主讲人的id
	 */
	void removeSpeaker(int id);
	
	 /**
	  * 查询主讲人
	  * @param selectKey 根据姓名和职位
	  * @return
	  */
	List<Speaker> listSpeaker(SelectKey selectKey);
	
	
}
