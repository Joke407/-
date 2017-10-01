package com.zhiyou100.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.CourseDao;
import com.zhiyou100.model.Course;
import com.zhiyou100.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao dao;
	
	public void saveCourse(Course course) {
		dao.saveCourse(course);
			
	}

	public void removeCourse(int id) {
		
		dao.removeCourse(id);
	}

	public void updateCourse(Course course) {
		
		dao.updateCourse(course);
	}

	public List<Course> listCourse() {
		
		return dao.listCourse();
	}

}
