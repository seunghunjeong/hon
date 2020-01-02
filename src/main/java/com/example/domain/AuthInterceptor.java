package com.example.domain;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("uid") == null) {
			//이동하고자했던 주소
			String uri = request.getRequestURI();
			String query=request.getQueryString();
			query = (query != null) ? ("?" + query) : "";
			if(request.getMethod().equals("GET")) {
				request.getSession().setAttribute("dest", uri + query);
			}
			
			System.out.println("uri:" + uri);
			
			response.sendRedirect("login");
		}
		return super.preHandle(request, response, handler);
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	}
