package com.zhiyou100.model;

public class SelectKey {
	
	private int page;
	
	/**
	 * 查询的视频标题
	 */
	private String videoTitle;
	
	/**
	 * 查询的视频主讲人de id
	 */
	private int videoSpeaker;
	
	/**
	 * 查询的视频所属课程id
	 */
	private int videoSource;

	/**
	 * 主讲人的姓名
	 * 
	 */
	private String speakerName;
	
	
	/**
	 * 主讲人的职位
	 */
	private String speakerPosition;


	public SelectKey() {
		super();
	}


	public SelectKey(int page, String videoTitle, int videoSpeaker, int videoSource, String speakerName,
			String speakerPosition) {
		super();
		this.page = page;
		this.videoTitle = videoTitle;
		this.videoSpeaker = videoSpeaker;
		this.videoSource = videoSource;
		this.speakerName = speakerName;
		this.speakerPosition = speakerPosition;
	}


	@Override
	public String toString() {
		return "SelectKey [page=" + page + ", videoTitle=" + videoTitle + ", videoSpeaker=" + videoSpeaker
				+ ", videoSource=" + videoSource + ", speakerName=" + speakerName + ", speakerPosition="
				+ speakerPosition + "]";
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public String getVideoTitle() {
		return videoTitle;
	}


	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}


	public int getVideoSpeaker() {
		return videoSpeaker;
	}


	public void setVideoSpeaker(int videoSpeaker) {
		this.videoSpeaker = videoSpeaker;
	}


	public int getVideoSource() {
		return videoSource;
	}


	public void setVideoSource(int videoSource) {
		this.videoSource = videoSource;
	}


	public String getSpeakerName() {
		return speakerName;
	}


	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}


	public String getSpeakerPosition() {
		return speakerPosition;
	}


	public void setSpeakerPosition(String speakerPosition) {
		this.speakerPosition = speakerPosition;
	}


	
	
	
	

}
