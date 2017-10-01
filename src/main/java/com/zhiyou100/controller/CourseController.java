package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Course;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.vo.ResponseVO;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService service;
	
	@RequestMapping(path="/course/save", method=RequestMethod.POST)
	public@ResponseBody ResponseVO<Course> saveCourse(@RequestBody Course course) {
		
		service.saveCourse(course);
		return new ResponseVO<Course>(0, "增加成功！", course);

	}
	
	@RequestMapping(path="/course/remove", method=RequestMethod.DELETE)
	public @ResponseBody ResponseVO<Course> removeCourse(@RequestBody HashMap<String, Integer> map) {
		
		service.removeCourse(map.get("id"));
		return new ResponseVO<Course>(0, "删除成功！", null);

		
	}
	
	@RequestMapping(path="/course/update", method=RequestMethod.PUT)
	public @ResponseBody ResponseVO<Course> updateCourse(@RequestBody Course course) {
		
		service.updateCourse(course);
		return new ResponseVO<Course>(0, "更新成功！", course);
	}


	@RequestMapping(path="/course/list", method=RequestMethod.GET)
	public @ResponseBody List<Course> updateCourse() {
		
		return service.listCourse();
	}
	
	
}
