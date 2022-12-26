
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
	// NoticeDAO ��ü ����
	NoticeDAO dao = new NoticeDAO();
	
/// -- notice/list ----------------------------------------------------------------------------------------------------------------------------------

	// ������ ���
	public List<NoticeView> getNoticeViewAdminList(){
		// �����ε� ��ȣ��
		return getNoticeViewAdminList(1);
	}
	
	public List<NoticeView> getNoticeViewAdminList(int page){
		// �����ε� ��ȣ��
		return getNoticeViewAdminList("title", "", page);
	}
	
	public List<NoticeView> getNoticeViewAdminList(String field, String query, int page){
	    // dao.selectAdminList()�� �˻��ʵ�(field), �˻���(query), ������(page)�� �־ ������ ����� �޾Ƴ�
		List<NoticeView> list = dao.selectAdminList(field, query, page);
	    return list;
	}
	
	// �⺻ ���
	public List<NoticeView> getNoticeViewList(){
		// �����ε� ��ȣ��
		return getNoticeViewList(1);
	}
	
	public List<NoticeView> getNoticeViewList(int page){
		// �����ε� ��ȣ��
		return getNoticeViewList("title", "", page);
	}
	
	public List<NoticeView> getNoticeViewList(String field, String query, int page){
	    // dao.selectList()�� �˻��ʵ�(field), �˻���(query), ������(page)�� �־ �⺻ ����� �޾Ƴ�
		List<NoticeView> list = dao.selectList(field, query, page);
	    return list;
	}
	
	// ������ �� ����
	public int getNoticeAdminCount() {
		// �����ε� ��ȣ��
		return getNoticeAdminCount("title", "");
	}
	
	public int getNoticeAdminCount(String field, String query) {
		// dao.selectNoticeAdminCnt()�� �˻��ʵ�(field), �˻���(query)�� �־ ������ �� ������ �޾Ƴ� 
		int count = dao.selectNoticeAdminCnt(field, query);
		return count;
	}

	// �� ����
	public int getNoticeCount() {
		// �����ε� ��ȣ��
		return getNoticeCount("title", "");
	}
	
	public int getNoticeCount(String field, String query) {
		// dao.selectNoticeCnt()�� �˻��ʵ�(field), �˻���(query)�� �־ �� ������ �޾Ƴ�
		int count = dao.selectNoticeCnt(field, query);
		return count;
	}

	// �ϰ����� ��û 
	public int pubNoticeAll(int[] oids, int[] cids) {
		// int �迭�� List<String>���� ������
		List<String> oidsList = new ArrayList<String>();
		for(int i =0; i < oids.length; i++)
			oidsList.add(String.valueOf(oids[i]));
		List<String> cidsList = new ArrayList<String>();
		for(int i =0; i < cids.length; i++)
			cidsList.add(String.valueOf(cids[i]));
		
		// �����ε� ��ȣ��
		return pubNoticeAll(oidsList, cidsList);
	}
	
	public int pubNoticeAll(List<String> oids, List<String> cids) {
		// List<String>�� String���� ������
		String oidsCVS = String.join(",", oids);
		String cidsCVS = String.join(",", cids);
		
		// �����ε� ��ȣ��
		return pubNoticeAll(oidsCVS, cidsCVS);
	}
	
	public int pubNoticeAll(String oidsCVS, String cidsCVS) {
		// dao.updatePubAll()�� ���� ID(oidsCVS)�� ����� ID(cidsCVS)�� �־ �ϰ� ����/������� ����
		int result = dao.updatePubAll(oidsCVS, cidsCVS);
		return result;
	}
	
	// �ϰ����� ��û 
	public int removeNoticeAll(int[] dids) {
		// int �迭�� List<String>���� ������
		List<String> didsList = new ArrayList<>();
		for(int i = 0; i < dids.length; i++)
			didsList.add(String.valueOf(dids[i]));
		
		// �����ε� ��ȣ��
		return removeNoticeAll(didsList);
	}
	
	public int removeNoticeAll(List<String> didsList) {
		// List<String>�� String���� ������
		String dids_CVS = String.join(",", didsList);
		
		// �����ε� ��ȣ��
		return removeNoticeAll(dids_CVS);
	}
	
	public int removeNoticeAll(String dids_CVS) {
		// dao.deleteNoticeAll()�� ������ ID(dids_CVS)�� �־ �ϰ� ������ ����
		int result = dao.deleteNoticeAll(dids_CVS);
    	return result;
	}
		
/// -- notice/reg -----------------------------------------------------------------------------------------------------------------------------------

	// �� ��� ��û 
	public int regNotice(String title, String file, String writerId, String content, int open) {
		// ���� ������ ��� Notice�� �����ϴ� ����
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setFiles(file);
		notice.setWriterId(writerId);
		notice.setContent(content);
		notice.setPub(open);
		
		// �����ε� ��ȣ��
		return regNotice(notice);
	}
	
	public int regNotice(Notice notice) {
		// dao.insertNotice()�� notice�� �־ ���� �����
		int result = dao.insertNotice(notice);
		return result;
	}
		
/// -- notice/detail --------------------------------------------------------------------------------------------------------------------------------
	
	// ����ȸ
	public Notice getNotice(int id) {
		// dao.selectNotice()�� id�� �־ ���� �� ��ȸ��
		Notice n = dao.selectNotice(id);
		return n;
	}
	
	// ������ ������ ��ȸ
	public Notice getNextAdminNotice(int id, String field, String query) {
		// dao.selectNextAdminNotice()�� id, �˻��ʵ�(field), �˻���(query)�� �־ �����ڿ� �������� ��ȸ��
		Notice n = dao.selectNextAdminNotice(id, field, query);
		return n;
	}

	// ������ ������ ��ȸ
	public Notice getPrevAdminNotice(int id, String field, String query) {
		// dao.selectPrevAdminNotice()�� id, �˻��ʵ�(field), �˻���(query)�� �־ �����ڿ� �������� ��ȸ��
		Notice n = dao.selectPrevAdminNotice(id, field, query);
		return n;		
	}
	
	// ������ ��ȸ
	public Notice getNextNotice(int id, String field, String query) {
		// dao.selectNextNotice()�� id, �˻��ʵ�(field), �˻���(query)�� �־ �������� ��ȸ��
	    Notice n = dao.selectNextNotice(id, field, query);
		return n;		
	}

	// ������ ��ȸ
	public Notice getPrevNotice(int id, String field, String query) {
		// dao.selectPrevNotice()�� id, �˻��ʵ�(field), �˻���(query)�� �־ �������� ��ȸ��
		Notice n = dao.selectPrevNotice(id, field, query);
	  	return n;
	}
	
/// -- notice/delete --------------------------------------------------------------------------------------------------------------------------------	

	// �� ���� ��û 
	public int removeNotice(int id) {
		// dao.deleteNotice()�� id�� �־ ���� ������
		int result = dao.deleteNotice(id);
    	return result;
	}
	
/// -- notice/update --------------------------------------------------------------------------------------------------------------------------------
	
	// �� ���� ��û 
	public int modifyNotice(int id, String title, String file, String content, int open) {
		// ���� ������ ��� Notice�� �����ϴ� ����
		Notice notice = new Notice();
		notice.setNid(id);
		notice.setTitle(title);
		notice.setFiles(file);
		notice.setContent(content);
		notice.setPub(open);
		
		// �����ε� ��ȣ��
		return modifyNotice(notice);
	}
	
	public int modifyNotice(Notice notice) {
		// dao.updateNotice()�� notice�� �־ ���� ������
		int result = dao.updateNotice(notice);
    	return result;
	}
	
/// -- index ----------------------------------------------------------------------------------------------------------------------------------------

	// ������ �ֽ� �� ��� ��û 
	public List<Notice> getNoticeAdminNewestList(){
		// dao.selectAdminNewestList()�� ȣ���Ͽ� ������ �ֽ� �� ����� �޾ƿ�
		List<Notice> list = dao.selectAdminNewestList();
  	    return list;
	}

	// �ֽ� �� ��� ��û 
	public List<Notice> getNoticeNewestList(){
		// dao.selectNewestList()�� ȣ���Ͽ� �ֽ� �� ����� �޾ƿ�
		List<Notice> list = dao.selectNewestList();
		return list;
	}

/// -- member/myPage ----------------------------------------------------------------------------------------------------------------------------------------
	
	// �� �� ���
	public List<NoticeView> getMyNoticeViewList(){
		// �����ε� ��ȣ��
		return getMyNoticeViewList(1);
	}
	
	public List<NoticeView> getMyNoticeViewList(int page){
		// �����ε� ��ȣ��
		return getMyNoticeViewList("title", "", page, "");
	}
	
	public List<NoticeView> getMyNoticeViewList(String field, String query, int page, String mid){		
		// dao.selectMyList()�� �˻��ʵ�(field), �˻���(query), ������(page), �ۼ���(mid)�� �־ �� �� ����� �޾ƿ�
		List<NoticeView> list = dao.selectMyList(field, query, page, mid);
	    return list;
	}

	// �� �ۼ�
	public int getMyNoticeCount() {
		// �����ε� ��ȣ��
		return getMyNoticeCount("title", "", "");
	}
	
	public int getMyNoticeCount(String field, String query, String mid) {
		// dao.selectMyNoticeCnt()�� �˻��ʵ�(field), �˻���(query), �ۼ���(mid)�� �־ �� ���� ������ �޾ƿ�
		int count = dao.selectMyNoticeCnt(field, query, mid);
		return count;				
	}

	// ���� �� �� ��ȸ
	public Notice getNextMyNotice(int id, String mid, String field, String query) {
		// dao.selectNextMyNotice()�� id, �ۼ���(mid), �˻��ʵ�(field), �˻���(query)�� �־ ���� �� ���� ��ȸ
		Notice n = dao.selectNextMyNotice(id, mid, field, query);
		return n;		
	}

	// ���� �� �� ��ȸ
	public Notice getPrevMyNotice(int id, String mid, String field, String query) {
		// dao.selectPrevMyNotice()�� id, �ۼ���(mid), �˻��ʵ�(field), �˻���(query)�� �־ ���� �� ���� ��ȸ
		Notice n = dao.selectPrevMyNotice(id, mid, field, query);
		return n;
	}
}