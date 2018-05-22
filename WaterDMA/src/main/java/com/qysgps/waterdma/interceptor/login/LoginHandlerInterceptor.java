package com.qysgps.waterdma.interceptor.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.qysgps.waterdma.entity.User;
import com.qysgps.waterdma.util.Const;
import com.qysgps.waterdma.util.Jurisdiction;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
			return true;
		}else{
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			User user = (User) session.getAttribute(Const.SESSION_USER);
			if(user !=null){
				boolean b = Jurisdiction.hasJurisdiction(path);
				if(!b){
					response.sendRedirect(Const.LOGIN);
				}
				return b;
			}else{
				response.sendRedirect(Const.LOGIN);
				return false;
			}
		}
	}

}
