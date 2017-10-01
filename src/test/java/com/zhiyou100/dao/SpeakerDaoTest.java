package com.zhiyou100.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Speaker;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class SpeakerDaoTest {

	@Autowired
	private SpeakerDao dao;
	
	@Test
	public void testSaveSpeaker() {
		Speaker speaker = new Speaker();
		speaker.setName("张三");
		speaker.setPosition("高级讲师");
		speaker.setDescribe("中国一流");
		speaker.setImageUrl("head.jpg");
		dao.saveSpeaker(speaker);
	}

	@Test
	public void testUpdateSpeaker() {
		Speaker speaker = new Speaker();
		speaker.setName("李四");
		speaker.setPosition("高级讲师");
		speaker.setDescribe("中国一流");
		speaker.setImageUrl("head.jpg");
		speaker.setId(6);
		dao.updateSpeaker(speaker);
	}

	@Test
	public void testRemoveSpeaker() {
		dao.removeSpeaker(6);
	}

	@Test
	public void testListSpeaker() {
		SelectKey selectKey = new SelectKey();
	
		selectKey.setSpeakerPosition("高级讲师");
		List<Speaker> list = dao.listSpeaker(selectKey);
		for (Speaker speaker : list) {
			System.out.println(speaker);
		}
	}

}
