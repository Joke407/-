package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.SpeakerDao;
import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService {

	@Autowired
	private SpeakerDao dao;
	
	public void saveSpeaker(Speaker speaker) {
		
		dao.saveSpeaker(speaker);
	}

	public void updateSpeaker(Speaker speaker) {
		
		dao.updateSpeaker(speaker);
	}

	public void removeSpeaker(int id) {

		dao.removeSpeaker(id);
	}

	public List<Speaker> listSpeaker(SelectKey selectKey) {

		
		return dao.listSpeaker(selectKey);
	}

}
