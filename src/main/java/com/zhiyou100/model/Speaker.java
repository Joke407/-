package com.zhiyou100.model;

public class Speaker {
	
	private int id;
	
	private String name;
	
	private String position;
	
	private String imageUrl;
	
	private String describe;

	public Speaker() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Speaker(int id, String name, String position, String imageUrl, String describe) {
		super();
		this.id = id;
		this.name = name;
		this.position = position;
		this.imageUrl = imageUrl;
		this.describe = describe;
	}

	@Override
	public String toString() {
		return "Speaker [id=" + id + ", name=" + name + ", position=" + position + ", imageUrl=" + imageUrl
				+ ", describe=" + describe + "]";
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	
}
