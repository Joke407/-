package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Course;

public interface CourseDao {


	/**
	 * 存储课程信息
	 * @param course
	 */
	int saveCourse(Course course);
	
	/**
	 * 删除课程
	 * @param id
	 */
	int removeCourse(int id);
	
	/**
	 * 更新课程
	 * @param course
	 */
	int updateCourse(Course course);
	
	/**
	 * 获得课程的列表
	 * @return
	 */
	List<Course> listCourse();
}
