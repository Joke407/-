package com.zhiyou100.model;

public class Course {
	
	private int id;
	
	private String name;
	
	private String describe;
	
	private int subjectId;
	
	private String subjectName;

	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Course(int id, String name, String describe, int subjectId, String subjectName) {
		super();
		this.id = id;
		this.name = name;
		this.describe = describe;
		this.subjectId = subjectId;
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", describe=" + describe + ", subjectId=" + subjectId
				+ ", subjectName=" + subjectName + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}


	
	
}
