package com.green.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.green.service.SignInService;
import com.green.vo.MemberVO;

public class AuthCheckInterceptor implements HandlerInterceptor{
	
	@Autowired
	private SignInService signInService;
				//어댑터 패턴 / 디폴트 메서드
	//인터셉터를 적용하기 위해서 
	//1. 어떤 컨트롤러에 적용할지
	//2. 어떤 인터셉터를 적용할지
	
	@Override //로그인 되어 있는지 확이하여 처리 컨트롤러 수행되기 전 구동됨
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 컨트롤러가 수행되기 전 구동되는 메서드 => 로그인 인증
		
		HttpSession session = request.getSession();
		if(session != null) {
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user != null) {
				session.setAttribute("user", signInService.getMember(user.getId()));
				return true;
			}
		}
		
		response.sendRedirect(request.getContextPath()+"/signInForm");
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러가 수행된 후 / 뷰페이지가 작동되기 전 구동되는 메서드
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 뷰페이지까지 보여주고 난 후에 구동되는 메서드,
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	
	
}
