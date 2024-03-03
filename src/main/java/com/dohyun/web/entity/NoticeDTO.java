package com.dohyun.web.entity;

import java.time.LocalDateTime;

public class NoticeDTO extends Notice {
	private String regDateTimeView;

	public NoticeDTO() {
	}

	public NoticeDTO(int nid, String title, String writerId, String content, LocalDateTime regDate, String regDateView,
			int hit, String files, int pub) {

		super(nid, title, writerId, content, regDate, hit, files, pub);
		regDateTimeView = regDateView;
	}

	public NoticeDTO(Notice n, String regDateView) {
		super(n.getNid(), n.getTitle(), n.getWriterId(), n.getContent(), n.getRegDate(), n.getHit(), n.getFiles(),
				n.getPub());
		regDateTimeView = regDateView;
	}

	public String getRegDateTimeView() {
		return regDateTimeView;
	}

	public void setRegDateTimeView(String regDateTimeView) {
		this.regDateTimeView = regDateTimeView;
	}

	@Override
	public String toString() {
		return "NoticeDTO [regDateTimeView=" + regDateTimeView + ", toString()=" + super.toString() + ", getNid()="
				+ getNid() + ", getTitle()=" + getTitle() + ", getWriterId()=" + getWriterId() + ", getContent()="
				+ getContent() + ", getRegDate()=" + getRegDate() + ", getHit()=" + getHit() + ", getFiles()="
				+ getFiles() + ", getPub()=" + getPub() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
}
