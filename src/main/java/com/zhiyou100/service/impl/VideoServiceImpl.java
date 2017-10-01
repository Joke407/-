package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.VideoDao;
import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;
@Service
public class VideoServiceImpl implements VideoService{
	
	@Autowired
	private VideoDao dao;

	public void addVideo(Video video) {

		dao.addVideo(video);
	}

	public void removeVideo(int[] id) {

		dao.removeVideo(id);
	}

	public void updateVideo(Video video) {

		
		dao.updateVideo(video);
	}

	public List<Video> listVideo(SelectKey selectKey) {

		return dao.listVideo(selectKey);
	}

	public int getVideoNum(SelectKey selectKey) {

		return dao.getVideoNum(selectKey);
	}

}
