package com.dohyun.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.dohyun.web.entity.Notice;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

//multipart/form-data �������� ���ڵ��ϱ� ���ؼ� �����ؾ��ϴ� ������̼�
@MultipartConfig(
		fileSizeThreshold=1024*1024,
	    maxFileSize=1024*1024*5,
	    maxRequestSize=1024*1024*5*5
	)
@WebServlet("/memberMyUpdate")
public class MyUpdate_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ������ ���� id ������ �ĺ��ϱ� ������ ���� �޾ƿ�
		int id = Integer.parseInt(req.getParameter("id"));
		
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
		// service.getNotice() �޼ҵ忡 id�� �־ id�� ���� Notice ��ü�� �޾ƿ�
		Notice notice = service.getNotice(id);
		
		req.setAttribute("n", notice);
		// �� �� �������� �Ѿ
		req.getRequestDispatcher("WEB-INF/view/member/myUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �� ��� form���� ���� �����͸� ����
		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		// multipart/form-data ���� ������ �ޱ� ���� Part �������̽�
		Part filePart = req.getPart("file");
		String content = req.getParameter("content");
		String open_ = req.getParameter("open");
		
		// ÷�����ϸ��� ������ ����
		String fileName = "";
		
		// ������ ������� �ʰ�, ���� �̸��� "file"�̸�, ������ ����� 0�� �ƴ϶�� ����
		if(filePart != null && filePart.getName().equals("file") && filePart.getSize() != 0) {
			fileName = filePart.getSubmittedFileName();   // ���Ͽ��� �̸��� ����
			InputStream fis = filePart.getInputStream();  // �������κ��� InputStream ����
			
		    // ���� ������ ����� ��� (����θ� ��� ���ϱ� ������ ������� ȹ��)
			String realPath = req.getServletContext().getRealPath("/upload");      
	
			// ��ΰ� �������� �ʴ´ٸ� ���丮 ����
			File path = new File(realPath);
			if(!path.exists())
			    path.mkdir();
	
			// ��� + �����̸����� ��θ� �ϼ� / File.separator�� ������
			String filePath = realPath + File.separator + fileName;  
			// FileOutputStream�� ��θ� ���� ����
			FileOutputStream fos = new FileOutputStream(filePath);
	
			// inputStream -> outputStream / ������ ��ο� ���� ����
			byte[] buf = new byte[1024];
			int size = 0;
			while((size=fis.read(buf)) != -1)
			    fos.write(buf, 0, size);
			
			// ��Ʈ�� �ݱ�
			fos.close();
			fis.close();
		}
		
		// open_�� �������� 0�� ���� / �⺻�� 1 => true
		int open = 1;
		if(open_ == null) {
			open = 0;
		}
		
		// Notice Ŭ���� ����
		Notice notice = new Notice();
		// �� ����
		notice.setNid(id);
		notice.setTitle(title);
		notice.setFiles(fileName);
		notice.setContent(content);
		notice.setPub(open);
		
		// NoticeService ��ü ����
		NoticeService service = new NoticeService();
		// service.modifyNotice() �޼ҵ忡 notice�� �־ �� ����
		int result = service.modifyNotice(notice);
		
		System.out.println("�����Ͱ� " + result + "����ŭ �����Ǿ����ϴ�."); 
		
		// �� �� ������� ���ư�
		resp.sendRedirect("memberMyPage");
	}
}
