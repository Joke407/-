package com.zhiyou100.dao;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Subject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class SubjectDaoTest {

	@Autowired
	private SubjectDao dao;
	
	@Test
	public void testListSubject() {
		List<Subject> list = dao.listSubject();
		
		for (Subject subject : list) {
			System.out.println(subject);
		}
	}

}
