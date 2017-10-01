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
import com.zhiyou100.model.Speaker;
import com.zhiyou100.model.Video;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class SpeakerController {

	@Autowired
	private SpeakerService service;
	
	@RequestMapping(path="/speaker/save", method=RequestMethod.POST)
	public @ResponseBody ResponseVO<Speaker> saveSpeaker(@RequestBody Speaker speaker) {
		
		service.saveSpeaker(speaker);
		return new ResponseVO<Speaker>(0, "增加成功！", speaker);

	}
	
	@RequestMapping(path="/speaker/remove", method=RequestMethod.DELETE)
	public @ResponseBody ResponseVO<Speaker> removeSpeaker(@RequestBody HashMap<String, Integer> map) {
		
		service.removeSpeaker(map.get("id"));
		return new ResponseVO<Speaker>(0, "删除成功！", null);

	}
	
	@RequestMapping(path="/speaker/update", method=RequestMethod.PUT)
	public @ResponseBody ResponseVO<Speaker> updateSpeaker(@RequestBody Speaker speaker) {
		
		service.updateSpeaker(speaker);
		return new ResponseVO<Speaker>(0, "更新成功！", speaker);

	}
	
	@RequestMapping(path="/speaker/list", method=RequestMethod.POST)
	public @ResponseBody List<Speaker> listSpeaker(@RequestBody SelectKey selectKey) {
		
		return service.listSpeaker(selectKey);
	}
	

}
