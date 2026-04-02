package com.glamourcosmetics.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);

        boolean userLoggedIn =
                session != null && session.getAttribute("username") != null;

        boolean adminLoggedIn =
                session != null && session.getAttribute("admin") != null;

        boolean isPublic =
                uri.endsWith("/") ||
                uri.endsWith("/index.jsp") ||
                uri.endsWith("/login.jsp") ||
                uri.endsWith("/register.jsp") ||
                uri.endsWith("/login") ||
                uri.endsWith("/register") ||

                // ✅ ADMIN LOGIN ALLOW
                uri.endsWith("/admin/admin-login.jsp") ||
                uri.endsWith("/admin-login") ||

                // ✅ STATIC FILES
                uri.contains("/css") ||
                uri.contains("/js") ||
                uri.contains("/images") ||
                uri.endsWith(".css") ||
                uri.endsWith(".js") ||
                uri.endsWith(".jpg") ||
                uri.endsWith(".png") ||
                uri.endsWith(".jpeg");

        boolean isAdminPage = uri.contains("/admin/");

        // 🔐 RULES
        if (isPublic) {
            chain.doFilter(request, response);
            return;
        }

        if (isAdminPage && adminLoggedIn) {
            chain.doFilter(request, response);
            return;
        }

        if (!isAdminPage && userLoggedIn) {
            chain.doFilter(request, response);
            return;
        }

        // ❌ Not authorized
        if (isAdminPage) {
            res.sendRedirect(req.getContextPath() + "/admin/admin-login.jsp");
        } else {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
