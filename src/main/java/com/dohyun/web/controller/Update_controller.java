package com.dohyun.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import com.dohyun.web.entity.NoticeDTO;
import com.dohyun.web.service.NoticeGetService;
import com.dohyun.web.service.NoticeSetService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

//multipart/form-data 형식으로 인코딩하기 위해서 설정해야하는 어노테이션
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)

@WebServlet("/update")
public class Update_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 예외처리 : id(식별자) / 기본값 : 1
		String nid_ = req.getParameter("id");
		int nid = (nid_ == null) ? 1 : (nid_ == "") ? 1 : Integer.parseInt(nid_);

		// NoticeService 객체 생성
		NoticeGetService service = new NoticeGetService();

		// 게시글 상세 조회
		NoticeDTO notice = service.getNotice(nid);

		req.setAttribute("n", notice);
		req.getRequestDispatcher("WEB-INF/view/notice/update.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// form 내용
		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title_");
		Part filePart = req.getPart("file"); // Part : multipart/form-data 으로 파일을 받기 위한 인터페이스
		String content = req.getParameter("content");
		String open_ = req.getParameter("open");

		String og_file = req.getParameter("og_file");

		// 예외처리 : l(게시판 or 마이페이지) / 기본값 : "1"
		String listFlag = req.getParameter("l");
		listFlag = (listFlag == null) ? "1" : (listFlag == "") ? "1" : listFlag;

		// 첨부 파일명의 변수를 생성
		String fileName = "";

		// 파일 이름 = "file" & 빈 파일 X
		if (filePart != null && filePart.getName().equals("file") && filePart.getSize() != 0) {
			fileName = filePart.getSubmittedFileName(); // 파일에서 이름을 빼냄
			InputStream fis = filePart.getInputStream(); // 파일으로부터 InputStream 생성

			// 받은 파일이 저장될 경로 (상대경로를 사용 못하기 때문에 물리경로 획득)
			String realPath = req.getServletContext().getRealPath("/upload");

			// 경로가 존재하지 않는다면 디렉토리 생성
			File path = new File(realPath);
			if (!path.exists())
				path.mkdir();

			// 경로 + 파일이름으로 경로를 완성 / File.separator는 구분자
			String filePath = realPath + File.separator + fileName;

			// FileOutputStream을 경로를 통해 생성
			FileOutputStream fos = new FileOutputStream(filePath);

			// inputStream -> outputStream / 지정된 경로에 파일 저장
			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = fis.read(buf)) != -1)
				fos.write(buf, 0, size);

			// 스트림 닫기
			fos.close();
			fis.close();
		} else {
			fileName = og_file;
		}

		// open_이 비공개라면 0을 넣음 / 기본값 1 => true
		int open = 1;
		if (open_ == null) {
			open = 0;
		}

		// NoticeService 객체 생성
		NoticeSetService service = new NoticeSetService();

		// 게시글 수정
		int result = service.modifyNotice(id, title, fileName, content, open);
		System.out.println("데이터가 " + result + "개만큼 수정되었습니다.");

		// 목록으로 돌아감
		resp.sendRedirect("list?l=" + listFlag);
	}
}
