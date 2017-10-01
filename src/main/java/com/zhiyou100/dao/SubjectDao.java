package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Subject;

public interface SubjectDao {
	

	/**
	 * 获得学科列表
	 * @return
	 */
	List<Subject> listSubject();
}
