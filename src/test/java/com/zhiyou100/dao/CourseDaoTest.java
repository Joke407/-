package com.zhiyou100.dao;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Course;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class CourseDaoTest {

	
	@Autowired
	private CourseDao dao;
	
	@Test
	public void testSaveCourse() {
		Course course = new Course();
		course.setName("30天精通java");
		course.setDescribe("轻松让你30天放弃java");
		course.setSubjectId(2);
		dao.saveCourse(course);
	}

	@Test
	public void testRemoveCourse() {
		dao.removeCourse(9);
	}

	@Test
	public void testUpdateCourse() {
		Course course = new Course();
		course.setName("30天放弃java");
		course.setDescribe("哈哈哈轻松让你30天放弃java");
		course.setSubjectId(2);
		course.setId(9);
		dao.updateCourse(course);
	}

	@Test
	public void testListCourse() {
		List<Course> list = dao.listCourse();
		for (Course course : list) {
			System.out.println(course);
		}
	}

}
