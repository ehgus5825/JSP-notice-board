package com.dohyun.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.dohyun.web.entity.Member;
import com.dohyun.web.entity.Notice;
import com.dohyun.web.service.NoticeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

//multipart/form-data 형식으로 인코딩하기 위해서 설정해야하는 어노테이션
@MultipartConfig(
	fileSizeThreshold=1024*1024,
    maxFileSize=1024*1024*5,
    maxRequestSize=1024*1024*5*5
)
@WebServlet("/noticeReg")
public class Reg_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 등록으로 넘어감
		req.getRequestDispatcher("WEB-INF/view/notice/reg.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 글 등록시 작성자를 얻기 위한 Session
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("userMember");
		
		// 글 등롤 form으로 부터 데이터를 받음
		String title = req.getParameter("title");
		// multipart/form-data 으로 파일을 받기 위한 Part 인터페이스
		Part filePart = req.getPart("file");
		String content = req.getParameter("content");
		String open_ = req.getParameter("open");
		
		// 첨부파일명의 변수를 생성
		String fileName = "";
		
		// 파일이 비어있지 않고, 파일 이름이 "file"이며, 파일의 사이즈가 0이 아니라면 진입
		if(filePart != null && filePart.getName().equals("file") && filePart.getSize() != 0) {
			fileName = filePart.getSubmittedFileName();   // 파일에서 이름을 빼냄
			InputStream fis = filePart.getInputStream();  // 파일으로부터 InputStream 생성
			
		    // 받은 파일이 저장될 경로 (상대경로를 사용 못하기 때문에 물리경로 획득)
			String realPath = req.getServletContext().getRealPath("/upload");      
		
			// 경로가 존재하지 않는다면 디렉토리 생성
			File path = new File(realPath);
			if(!path.exists())
			    path.mkdir();
		
			// 경로 + 파일이름으로 경로를 완성 / File.separator는 구분자
			String filePath = realPath + File.separator + fileName;
			// FileOutputStream을 경로를 통해 생성
			FileOutputStream fos = new FileOutputStream(filePath);
			
			// inputStream -> outputStream / 지정된 경로에 파일 저장
			byte[] buf = new byte[1024];
			int size = 0;
			while((size=fis.read(buf)) != -1)
			    fos.write(buf, 0, size);
		
			// 스트림 닫기
			fos.close();
			fis.close();
		}
		
		// open_이 비공개라면 0을 넣음 / 기본값 1 => true
		int open = 1;
		if(open_ == null) {
			open = 0;
		}
		
		// Notice 클래스 생성
		Notice notice = new Notice();
		// 값 설정
		notice.setTitle(title);
		notice.setFiles(fileName);
		notice.setWriterId(member.getMid());
		notice.setContent(content);
		notice.setPub(open);
		
		// NoticeService 객체 생성
		NoticeService service = new NoticeService();
		// service.regNotice() 메소드에 notice를 넣어서 글 등록
		int result = service.regNotice(notice);
		
		System.out.println("데이터가 " + result + "개만큼 추가되었습니다."); 
		
		// 글 목록으로 돌아감
		resp.sendRedirect("noticeList");
	}
}
