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
		// servlet���� �������ų� �������� �����Ϳ� �Ϸ��� �۾��� ���� 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// request�� response�� encoding�� `UTF-8`�� ����
        response.setContentType("text/html; charset=UTF-8");
		// response�� ������ ����� `text/html; charset=UTF-8`�� ����
		
        // ���� ó���� request, response�� �� �������� ����
		chain.doFilter(request, response);
	}
}
