package com.dohyun.web.entity;

import java.util.Date;

public class NoticeView extends Notice {
	private int cmtCount;
	
	public NoticeView(int nid, String title, String writerId, Date regDate, int hit, String files, int pub, int cmtCount) {
		super(nid, title, writerId, "", regDate, hit, files, pub);
		this.cmtCount = cmtCount;
	}

	public int getCmtCount() {
		return cmtCount;
	}

	public void setCmtCount(int cmtCount) {
		this.cmtCount = cmtCount;
	}
}
