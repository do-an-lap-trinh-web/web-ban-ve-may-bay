package com.edu.hcmuaf.fit.webbanvemaybay.filters;

import com.edu.hcmuaf.fit.webbanvemaybay.models.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
            ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res =  (HttpServletResponse) response;

        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");

        if (user == null || !"admin".equals(user.getRole())) {
            req.setAttribute("messageAdmin", "Bạn không có quyền truy cập trang web này");
            req.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        chain.doFilter(request, response);
    }
}