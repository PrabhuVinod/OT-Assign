package com.practise;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        	HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("username") == null) {
            	System.out.println("2222222222222222222");
                response.sendRedirect(request.getContextPath()); 
            } else {
            	System.out.println("333333333333333333");
                chain.doFilter(req, res); 
            }
        
    }

    @Override
    public void destroy() {
    }

}