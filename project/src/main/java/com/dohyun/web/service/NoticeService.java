
package com.dohyun.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dohyun.web.dao.NoticeDAO;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.entity.NoticeView;

public class NoticeService {
	// NoticeDAO 객체 생성
	NoticeDAO dao = new NoticeDAO();
	
/// -- notice/list ----------------------------------------------------------------------------------------------------------------------------------

	// 관리자 목록
	public List<NoticeView> getNoticeViewAdminList(){
		// 오버로딩 재호출
		return getNoticeViewAdminList(1);
	}
	
	public List<NoticeView> getNoticeViewAdminList(int page){
		// 오버로딩 재호출
		return getNoticeViewAdminList("title", "", page);
	}
	
	public List<NoticeView> getNoticeViewAdminList(String field, String query, int page){
	    // dao.selectAdminList()에 검색필드(field), 검색어(query), 페이지(page)를 넣어서 관리자 목록을 받아냄
		List<NoticeView> list = dao.selectAdminList(field, query, page);
	    return list;
	}
	
	// 기본 목록
	public List<NoticeView> getNoticeViewList(){
		// 오버로딩 재호출
		return getNoticeViewList(1);
	}
	
	public List<NoticeView> getNoticeViewList(int page){
		// 오버로딩 재호출
		return getNoticeViewList("title", "", page);
	}
	
	public List<NoticeView> getNoticeViewList(String field, String query, int page){
	    // dao.selectList()에 검색필드(field), 검색어(query), 페이지(page)를 넣어서 기본 목록을 받아냄
		List<NoticeView> list = dao.selectList(field, query, page);
	    return list;
	}
	
	// 관리자 글 개수
	public int getNoticeAdminCount() {
		// 오버로딩 재호출
		return getNoticeAdminCount("title", "");
	}
	
	public int getNoticeAdminCount(String field, String query) {
		// dao.selectNoticeAdminCnt()에 검색필드(field), 검색어(query)를 넣어서 관리자 글 개수를 받아냄 
		int count = dao.selectNoticeAdminCnt(field, query);
		return count;
	}

	// 글 개수
	public int getNoticeCount() {
		// 오버로딩 재호출
		return getNoticeCount("title", "");
	}
	
	public int getNoticeCount(String field, String query) {
		// dao.selectNoticeCnt()에 검색필드(field), 검색어(query)를 넣어서 글 개수를 받아냄
		int count = dao.selectNoticeCnt(field, query);
		return count;
	}

	// 일괄공개 요청 
	public int pubNoticeAll(int[] oids, int[] cids) {
		// int 배열을 List<String>으로 변경함
		List<String> oidsList = new ArrayList<String>();
		for(int i =0; i < oids.length; i++)
			oidsList.add(String.valueOf(oids[i]));
		List<String> cidsList = new ArrayList<String>();
		for(int i =0; i < cids.length; i++)
			cidsList.add(String.valueOf(cids[i]));
		
		// 오버로딩 재호출
		return pubNoticeAll(oidsList, cidsList);
	}
	
	public int pubNoticeAll(List<String> oids, List<String> cids) {
		// List<String>을 String으로 변경함
		String oidsCVS = String.join(",", oids);
		String cidsCVS = String.join(",", cids);
		
		// 오버로딩 재호출
		return pubNoticeAll(oidsCVS, cidsCVS);
	}
	
	public int pubNoticeAll(String oidsCVS, String cidsCVS) {
		// dao.updatePubAll()에 공개 ID(oidsCVS)와 비공개 ID(cidsCVS)를 넣어서 일괄 공개/비공개를 수행
		int result = dao.updatePubAll(oidsCVS, cidsCVS);
		return result;
	}
	
	// 일괄삭제 요청 
	public int removeNoticeAll(int[] dids) {
		// int 배열을 List<String>으로 변경함
		List<String> didsList = new ArrayList<>();
		for(int i = 0; i < dids.length; i++)
			didsList.add(String.valueOf(dids[i]));
		
		// 오버로딩 재호출
		return removeNoticeAll(didsList);
	}
	
	public int removeNoticeAll(List<String> didsList) {
		// List<String>을 String으로 변경함
		String dids_CVS = String.join(",", didsList);
		
		// 오버로딩 재호출
		return removeNoticeAll(dids_CVS);
	}
	
	public int removeNoticeAll(String dids_CVS) {
		// dao.deleteNoticeAll()에 삭제할 ID(dids_CVS)를 넣어서 일괄 삭제를 수행
		int result = dao.deleteNoticeAll(dids_CVS);
    	return result;
	}
		
/// -- notice/reg -----------------------------------------------------------------------------------------------------------------------------------

	// 글 등록 요청 
	public int regNotice(String title, String file, String writerId, String content, int open) {
		// 여러 값들을 모아 Notice로 변경하는 과정
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setFiles(file);
		notice.setWriterId(writerId);
		notice.setContent(content);
		notice.setPub(open);
		
		// 오버로딩 재호출
		return regNotice(notice);
	}
	
	public int regNotice(Notice notice) {
		// dao.insertNotice()에 notice를 넣어서 글을 등록함
		int result = dao.insertNotice(notice);
		return result;
	}
		
/// -- notice/detail --------------------------------------------------------------------------------------------------------------------------------
	
	// 상세조회
	public Notice getNotice(int id) {
		// dao.selectNotice()에 id를 넣어서 글을 상세 조회함
		Notice n = dao.selectNotice(id);
		return n;
	}
	
	// 관리자 다음글 조회
	public Notice getNextAdminNotice(int id, String field, String query) {
		// dao.selectNextAdminNotice()에 id, 검색필드(field), 검색어(query)를 넣어서 관리자용 다음글을 조회함
		Notice n = dao.selectNextAdminNotice(id, field, query);
		return n;
	}

	// 관리자 이전글 조회
	public Notice getPrevAdminNotice(int id, String field, String query) {
		// dao.selectPrevAdminNotice()에 id, 검색필드(field), 검색어(query)를 넣어서 관리자용 이전글을 조회함
		Notice n = dao.selectPrevAdminNotice(id, field, query);
		return n;		
	}
	
	// 다음글 조회
	public Notice getNextNotice(int id, String field, String query) {
		// dao.selectNextNotice()에 id, 검색필드(field), 검색어(query)를 넣어서 다음글을 조회함
	    Notice n = dao.selectNextNotice(id, field, query);
		return n;		
	}

	// 이전글 조회
	public Notice getPrevNotice(int id, String field, String query) {
		// dao.selectPrevNotice()에 id, 검색필드(field), 검색어(query)를 넣어서 이전글을 조회함
		Notice n = dao.selectPrevNotice(id, field, query);
	  	return n;
	}
	
/// -- notice/delete --------------------------------------------------------------------------------------------------------------------------------	

	// 글 삭제 요청 
	public int removeNotice(int id) {
		// dao.deleteNotice()에 id를 넣어서 글을 삭제함
		int result = dao.deleteNotice(id);
    	return result;
	}
	
/// -- notice/update --------------------------------------------------------------------------------------------------------------------------------
	
	// 글 수정 요청 
	public int modifyNotice(int id, String title, String file, String content, int open) {
		// 여러 값들을 모아 Notice로 변경하는 과정
		Notice notice = new Notice();
		notice.setNid(id);
		notice.setTitle(title);
		notice.setFiles(file);
		notice.setContent(content);
		notice.setPub(open);
		
		// 오버로딩 재호출
		return modifyNotice(notice);
	}
	
	public int modifyNotice(Notice notice) {
		// dao.updateNotice()에 notice를 넣어서 글을 수정함
		int result = dao.updateNotice(notice);
    	return result;
	}
	
/// -- index ----------------------------------------------------------------------------------------------------------------------------------------

	// 관리자 최신 글 목록 요청 
	public List<Notice> getNoticeAdminNewestList(){
		// dao.selectAdminNewestList()을 호출하여 관리자 최신 글 목록을 받아옴
		List<Notice> list = dao.selectAdminNewestList();
  	    return list;
	}

	// 최신 글 목록 요청 
	public List<Notice> getNoticeNewestList(){
		// dao.selectNewestList()을 호출하여 최신 글 목록을 받아옴
		List<Notice> list = dao.selectNewestList();
		return list;
	}

/// -- member/myPage ----------------------------------------------------------------------------------------------------------------------------------------
	
	// 내 글 목록
	public List<NoticeView> getMyNoticeViewList(){
		// 오버로딩 재호출
		return getMyNoticeViewList(1);
	}
	
	public List<NoticeView> getMyNoticeViewList(int page){
		// 오버로딩 재호출
		return getMyNoticeViewList("title", "", page, "");
	}
	
	public List<NoticeView> getMyNoticeViewList(String field, String query, int page, String mid){		
		// dao.selectMyList()에 검색필드(field), 검색어(query), 페이지(page), 작성자(mid)를 넣어서 내 글 목록을 받아옴
		List<NoticeView> list = dao.selectMyList(field, query, page, mid);
	    return list;
	}

	// 내 글수
	public int getMyNoticeCount() {
		// 오버로딩 재호출
		return getMyNoticeCount("title", "", "");
	}
	
	public int getMyNoticeCount(String field, String query, String mid) {
		// dao.selectMyNoticeCnt()에 검색필드(field), 검색어(query), 작성자(mid)를 넣어서 내 글의 개수를 받아옴
		int count = dao.selectMyNoticeCnt(field, query, mid);
		return count;				
	}

	// 다음 내 글 조회
	public Notice getNextMyNotice(int id, String mid, String field, String query) {
		// dao.selectNextMyNotice()에 id, 작성자(mid), 검색필드(field), 검색어(query)를 넣어서 다음 내 글을 조회
		Notice n = dao.selectNextMyNotice(id, mid, field, query);
		return n;		
	}

	// 이전 내 글 조회
	public Notice getPrevMyNotice(int id, String mid, String field, String query) {
		// dao.selectPrevMyNotice()에 id, 작성자(mid), 검색필드(field), 검색어(query)를 넣어서 이전 내 글을 조회
		Notice n = dao.selectPrevMyNotice(id, mid, field, query);
		return n;
	}
}