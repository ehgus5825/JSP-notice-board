package com.dohyun.web.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// servlet으로 보내지거나 내보내는 데이터에 일련의 작업을 수행 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// request와 response의 encoding을 `UTF-8`로 변경
        response.setContentType("text/html; charset=UTF-8");
		// response의 브라우저 출력을 `text/html; charset=UTF-8`로 변경
		
        // 필터 처리된 request, response을 본 서블릿으로 보냄
		chain.doFilter(request, response);
	}
}
