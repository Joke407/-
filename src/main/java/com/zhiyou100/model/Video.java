package com.zhiyou100.model;

public class Video {
	
	private int id;
	
	private String name;
	
	private String describe;
	
	private int length;
	
	private int playCount;
	
	private String coverUrl;
	
	private String videoUrl;
	
	private int courseId;
	
	private  int speakerId;
	
	private String speakerName;
	
	private String courseName;

	public Video() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Video(int id, String name, String describe, int length, int playCount, String coverUrl, String videoUrl,
			int courseId, int speakerId, String speakerName, String courseName) {
		super();
		this.id = id;
		this.name = name;
		this.describe = describe;
		this.length = length;
		this.playCount = playCount;
		this.coverUrl = coverUrl;
		this.videoUrl = videoUrl;
		this.courseId = courseId;
		this.speakerId = speakerId;
		this.speakerName = speakerName;
		this.courseName = courseName;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", name=" + name + ", describe=" + describe + ", length=" + length + ", playCount="
				+ playCount + ", coverUrl=" + coverUrl + ", videoUrl=" + videoUrl + ", courseId=" + courseId
				+ ", speakerId=" + speakerId + ", speakerName=" + speakerName + ", courseName=" + courseName + "]";
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

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getPlayCount() {
		return playCount;
	}

	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}

	public String getCoverUrl() {
		return coverUrl;
	}

	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getSpeakerId() {
		return speakerId;
	}

	public void setSpeakerId(int speakerId) {
		this.speakerId = speakerId;
	}

	public String getSpeakerName() {
		return speakerName;
	}

	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	
	
	
}
