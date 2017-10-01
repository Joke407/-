package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Course;

public interface CourseService {
	
	/**
	 * 存储课程信息
	 * @param course
	 */
	void saveCourse(Course course);
	
	/**
	 * 删除课程
	 * @param id
	 */
	void removeCourse(int id);
	
	/**
	 * 更新课程
	 * @param course
	 */
	void updateCourse(Course course);
	
	/**
	 * 获得课程的列表
	 * @return
	 */
	List<Course> listCourse();
	
	
}
