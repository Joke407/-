package com.zhiyou100.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Video;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class VideoDaoTest {

	@Autowired
	private VideoDao dao;
	
	@Test
	public void testAddVideo() {
		Video video = new Video();
		video.setName("abc");
		video.setDescribe("这是字母");
		video.setLength(200);
		video.setCoverUrl("cover.jgp");
		video.setVideoUrl("video.mp4");
		video.setCourseId(1);
		video.setSpeakerId(1);
		dao.addVideo(video);
	}

	@Test
	public void testRemoveVideo() {
		int[] num = new int[]{1,2,31};
		dao.removeVideo(num);
	}

	@Test
	public void testUpdateVideo() {
		Video video = new Video();
		video.setName("abc");
		video.setDescribe("这是字母");
		video.setLength(200);
		video.setCoverUrl("cover.jgp");
		video.setVideoUrl("video.mp4");
		video.setCourseId(1);
		video.setSpeakerId(1);
		video.setId(30);
		dao.updateVideo(video);
	}

	@Test
	public void testListVideo() {
		SelectKey selectKey = new SelectKey();
		selectKey.setPage(0);
		selectKey.setVideoTitle("H");
		
		List<Video> list = dao.listVideo(selectKey);
		for (Video video : list) {
			System.out.println(video);
		}
	}

	@Test
	public void testGetVideoNum() {
		SelectKey selectKey = new SelectKey();
		
		selectKey.setVideoSpeaker(1);
		
		
		System.out.println(dao.getVideoNum(selectKey));
	}

}
