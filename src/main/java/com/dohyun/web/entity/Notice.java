package com.dohyun.web.entity;

import java.time.LocalDateTime;

public class Notice {
	private int nid;
	private String title;
	private String writerId;
	private String content;
	private LocalDateTime regDateTime;
	private int hit;
	private String files;
	private int pub;
	
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", title=" + title + ", writeId=" + writerId + ", content=" + content
				+ ", regDate=" + regDateTime + ", hit=" + hit + ", files=" + files + ", pub=" + pub + "]";
	}

	public Notice() {}
	
	public Notice(int nid, String title, String writerId, String content, LocalDateTime regDate, int hit, String files, int pub) {
		super();
		this.nid = nid;
		this.title = title;
		this.writerId = writerId;
		this.content = content;
		this.regDateTime = regDate;
		this.hit = hit;
		this.files = files;
		this.pub = pub;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getRegDate() {
		return regDateTime;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDateTime = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public int getPub() {
		return pub;
	}
	public void setPub(int pub) {
		this.pub = pub;
	}
}
