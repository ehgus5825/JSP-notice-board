
package com.dohyun.web.service;

import java.util.List;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.dohyun.web.dao.NoticeDAO;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.entity.NoticeDTO;

public class NoticeGetService {

	// NoticeDAO 객체 생성
	NoticeDAO dao = new NoticeDAO();

// ---- 상세 조회 ---------------------------------------------------------------

	public NoticeDTO getNotice(int id) {
		// id => nid 제한 조회
		NoticeDTO n = toNoticeDTO(dao.selectNotice(id));
		return n;
	}

// ---- 목록 조회 ---- [검색필드(field), 검색어(query), 페이지(page), 정렬 기준(orderFlag) 조회] ----

	// [관리자 목록]
	public List<NoticeDTO> getNoticeAdminList(String field, String query, int page, String orderFlag) {
		// false => 공개 + 비공개
		List<NoticeDTO> list = toNoticeDTOList(dao.selectList(field, query, page, orderFlag, false, ""));
		return list;
	}

	// [기본 목록]
	public List<NoticeDTO> getNoticeList(String field, String query, int page, String orderFlag) {
		// true => 공개
		List<NoticeDTO> list = toNoticeDTOList(dao.selectList(field, query, page, orderFlag, true, ""));
		return list;
	}

	// [내 글 목록]
	public List<NoticeDTO> getMyNoticeList(String field, String query, int page, String orderFlag, String mid) {
		// mid => 작성자 제한
		List<NoticeDTO> list = toNoticeDTOList(dao.selectList(field, query, page, orderFlag, false, mid));
		return list;
	}

// ---- 글 개수 조회 ---- [검색필드(field), 검색어(query) 조회] -------------------------

	// [관리자 글 개수]
	public int getNoticeAdminCount(String field, String query) {
		// false => 공개 + 비공개
		int count = dao.selectNoticeCnt(field, query, false, "");
		return count;
	}

	// [글 개수]
	public int getNoticeCount(String field, String query) {
		// true => 공개
		int count = dao.selectNoticeCnt(field, query, true, "");
		return count;
	}

	// [내 글 개수]
	public int getMyNoticeCount(String field, String query, String mid) {
		// mid => 작성자 제한
		int count = dao.selectNoticeCnt(field, query, false, mid);
		return count;
	}

// ---- 다음 글 조회 ---- [ 현재 ID(id), 검색필드(field), 검색어(query) 조회 ] ------------

	// [관리자 다음 글 조회]
	public NoticeDTO getNextAdminNotice(int id, String field, String query) {
		// false => 공개 + 비공개
		NoticeDTO n = toNoticeDTO(dao.selectNextNotice(id, field, query, false, ""));
		return n;
	}

	// [다음 글 조회]
	public NoticeDTO getNextNotice(int id, String field, String query) {
		// true => 공개

		NoticeDTO n = toNoticeDTO(dao.selectNextNotice(id, field, query, true, ""));
		return n;
	}

	// [다음 내 글 조회]
	public NoticeDTO getNextMyNotice(int id, String mid, String field, String query) {
		// mid => 작성자 제한
		NoticeDTO n = toNoticeDTO(dao.selectNextNotice(id, field, query, false, mid));
		return n;
	}

// ---- 이전 글 조회 ---- [ 현재 ID(id), 검색필드(field), 검색어(query) 조회 ] -------------

	// [관리자 이전 글 조회]
	public NoticeDTO getPrevAdminNotice(int id, String field, String query) {
		// false => 공개 + 비공개
		NoticeDTO n = toNoticeDTO(dao.selectPrevNotice(id, field, query, false, ""));
		return n;
	}

	// [이전 글 조회]
	public NoticeDTO getPrevNotice(int id, String field, String query) {
		// true => 공개
		NoticeDTO n = toNoticeDTO(dao.selectPrevNotice(id, field, query, true, ""));
		return n;
	}

	// [이전 내 글 조회]
	public NoticeDTO getPrevMyNotice(int id, String mid, String field, String query) {
		// mid => 작성자 제한
		NoticeDTO n = toNoticeDTO(dao.selectPrevNotice(id, field, query, false, mid));
		return n;
	}

// ---- 미리보기 목록 조회 ----------------------------------------------------------

	// [관리자 최신 글 목록 요청]
	public List<NoticeDTO> getNoticeAdminNewestList() {
		// false => 공개 + 비공개 / REGDATE => 최신순
		List<NoticeDTO> list = toNoticeDTOList(dao.selectPreviewList(false, "REGDATE"));
		return list;
	}

	// [최신 글 목록 요청]
	public List<NoticeDTO> getNoticeNewestList() {
		// true => 공개 / REGDATE => 최신순
		List<NoticeDTO> list = toNoticeDTOList(dao.selectPreviewList(true, "REGDATE"));
		return list;
	}

	// [관리자 인기 글 목록 요청]
	public List<NoticeDTO> getNoticeAdminHitList() {
		// false => 공개 + 비공개 / HIT => 조회수
		List<NoticeDTO> list = toNoticeDTOList(dao.selectPreviewList(false, "HIT"));
		return list;
	}

	// [인기 글 목록 요청]
	public List<NoticeDTO> getNoticeHitList() {
		// true => 공개 / HIT => 조회수
		List<NoticeDTO> list = toNoticeDTOList(dao.selectPreviewList(true, "HIT"));
		return list;
	}

// ---- localDateTime => String 변환 ----------------------------------------------------------

	private List<NoticeDTO> toNoticeDTOList(List<Notice> list) {

		List<NoticeDTO> dtoList = new ArrayList<>();

		for (Notice item : list) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String regDateTimeView = item.getRegDate().toLocalDate().format(formatter);
			dtoList.add(new NoticeDTO(item, regDateTimeView));
		}

		return dtoList;
	}

	private NoticeDTO toNoticeDTO(Notice item) {

		if (item.getNid() != 0) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String regDateTimeView = item.getRegDate().format(formatter);
			return new NoticeDTO(item, regDateTimeView);
		}
		else {
			return new NoticeDTO(item, "");
		}
	}
}