package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Video;

public interface VideoDao {
	/**
	 * 增加视频
	 * @param video
	 */
	int addVideo(Video video);
	
	/**
	 * 删除若干视频
	 * @param id
	 */
	int removeVideo(int[] id);
	
	/**
	 * 更新视频信息
	 * @param video
	 */
	int updateVideo(Video video);
	
	/**
	 * 获得指定条件页数的视频列表
	 * @param 页码（分页使用）
	 * @return
	 */
	List<Video> listVideo(SelectKey selectKey);
	
	/**
	 * 
	 * @return 获得所有视频的条数
	 */
	int getVideoNum(SelectKey selectKey);
	
	
	
	
}
