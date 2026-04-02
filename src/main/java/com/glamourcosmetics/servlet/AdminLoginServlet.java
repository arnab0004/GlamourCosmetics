package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM admin WHERE email=? AND password=?";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("admin", email); // 🔐 admin session

                response.sendRedirect(
                    request.getContextPath() + "/admin/admin-dashboard.jsp"
                );
            } else {
                request.setAttribute("error", "Invalid admin credentials");
                request.getRequestDispatcher("/admin/admin-login.jsp")
                       .forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
