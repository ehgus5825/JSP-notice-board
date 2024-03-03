package com.dohyun.web.service;

import java.util.ArrayList;
import java.util.List;

import com.dohyun.web.dao.NoticeDAO;
import com.dohyun.web.entity.Notice;

public class NoticeSetService {

	// NoticeDAO 객체 생성
	NoticeDAO dao = new NoticeDAO();

	// 일괄 공개 요청 ----------------------------------------------------------

	public int pubNoticeAll(int[] oids, int[] cids) {

		// int [] => List<String>
		List<String> oidsList = new ArrayList<String>();
		List<String> cidsList = new ArrayList<String>();
		
		for (int i = 0; i < oids.length; i++)
			oidsList.add(String.valueOf(oids[i]));
		
		for (int i = 0; i < cids.length; i++)
			cidsList.add(String.valueOf(cids[i]));

		return pubNoticeAll(oidsList, cidsList);
	}

	public int pubNoticeAll(List<String> oids, List<String> cids) {

		// List<String> => String
		String oidsCVS = String.join(",", oids);
		String cidsCVS = String.join(",", cids);

		return pubNoticeAll(oidsCVS, cidsCVS);
	}

	public int pubNoticeAll(String oidsCVS, String cidsCVS) {
		
		// 일괄공개(oidsCVS) / 일괄비공개(cidsCVS) 수행 
		int result = dao.updatePubAll(oidsCVS, cidsCVS);
		return result;
	}

	// 일괄 삭제 요청 ----------------------------------------------------------

	public int removeNoticeAll(int[] dids) {
		
		// int[] => List<String>
		List<String> didsList = new ArrayList<>();
		for (int i = 0; i < dids.length; i++)
			didsList.add(String.valueOf(dids[i]));

		return removeNoticeAll(didsList);
	}

	public int removeNoticeAll(List<String> didsList) {
		
		// List<String> => String
		String dids_CVS = String.join(",", didsList);

		return removeNoticeAll(dids_CVS);
	}

	public int removeNoticeAll(String dids_CVS) {
		
		// 삭제할 IDs / ex. 1,2,3,4,5,6
		return dao.deleteNoticeAll(dids_CVS);
	}

	// 글 등록 요청 ----------------------------------------------------------

	public int regNotice(String title, String file, String writerId, String content, int open) {

		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setFiles(file);
		notice.setWriterId(writerId);
		notice.setContent(content);
		notice.setPub(open);

		return dao.insertNotice(notice);
	}

	// 글 삭제 요청 ----------------------------------------------------------

	public int removeNotice(int id) {
		
		return dao.deleteNotice(id);
	}

	// 글 수정 요청 ----------------------------------------------------------

	public int modifyNotice(int id, String title, String file, String content, int open) {
		
		Notice notice = new Notice();
		notice.setNid(id);
		notice.setTitle(title);
		notice.setFiles(file);
		notice.setContent(content);
		notice.setPub(open);
		
		return dao.updateNotice(notice);
	}
}
