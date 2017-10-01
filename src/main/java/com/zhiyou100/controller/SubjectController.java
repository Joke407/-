package com.zhiyou100.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Subject;
import com.zhiyou100.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	private SubjectService service;
	
	@RequestMapping(path="/subject/list", method=RequestMethod.GET)
	public @ResponseBody List<Subject> listSubject() {
		
		return service.listSubject();
	}
}
