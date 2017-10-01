package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.SelectKey;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class VideoController {

	
	@Autowired
	private VideoService service;
	
	@RequestMapping(path="/video/save", method=RequestMethod.POST)
	public @ResponseBody ResponseVO<Video> saveVideo(@RequestBody Video video) {
	
		service.addVideo(video);
		return new ResponseVO<Video>(0, "增加成功！", video);
	}
	
	
	@RequestMapping(path="/video/remove", method=RequestMethod.DELETE)
	public @ResponseBody ResponseVO<Video> removeVideo(@RequestBody HashMap<String, int[]> map) {
		
		service.removeVideo(map.get("id"));
		return new ResponseVO<Video>(0, "删除成功！", null);
	}
	
	@RequestMapping(path="/video/update", method=RequestMethod.PUT)
	public @ResponseBody ResponseVO<Video> updateVideo(@RequestBody Video video) {
		
		service.updateVideo(video);
		System.out.println(video+"11");
		return new ResponseVO<Video>(0, "更新成功！", video);

	}
	
	@RequestMapping(path="/video/list", method=RequestMethod.POST)
	public @ResponseBody List<Video> listVideo(@RequestBody SelectKey selectKey) {
		
		return service.listVideo(selectKey);
	}
	
	@RequestMapping(path="/video/count", method=RequestMethod.POST)
	public @ResponseBody int getCount(@RequestBody SelectKey selectKey) {
		
		return service.getVideoNum(selectKey);
	}
}
