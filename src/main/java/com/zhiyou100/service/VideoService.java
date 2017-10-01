package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Video;

public interface VideoService {

	/**
	 * 增加视频
	 * @param video
	 */
	void addVideo(Video video);
	
	/**
	 * 删除若干视频
	 * @param id
	 */
	void removeVideo(int[] id);
	
	/**
	 * 更新视频信息
	 * @param video
	 */
	void updateVideo(Video video);
	
	/**
	 * 获得指定条件页数的视频列表
	 * @param 页码（分页使用）
	 * @return
	 */
	List<Video> listVideo(SelectKey selectKey);
	
	/**
	 * 
	 * @return 获得视频的条数
	 */
	int getVideoNum(SelectKey selectKey);
	
	
	
	
	
	
	
	
}
