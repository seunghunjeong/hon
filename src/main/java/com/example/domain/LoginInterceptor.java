package com.example.domain;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("pre...............");
		HttpSession session=request.getSession();
		if(session.getAttribute("uid") != null) {
			session.removeAttribute("uid");
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post..............");
		
		//session정의
		HttpSession session=request.getSession();
		UserVO user=(UserVO)modelAndView.getModel().get("user");	// controller에서 보낸거?
		
		//로그인 성공
		if(user != null) {
			session.setAttribute("uid", user.getUid());
			session.setAttribute("user", user);
			String dest=(String)session.getAttribute("dest");
			response.sendRedirect(dest != null ? dest : "mainPage");
		}
		super.postHandle(request, response, handler, modelAndView);
	}
}
