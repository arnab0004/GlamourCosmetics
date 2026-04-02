package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password validation
        if (newPassword != null && !newPassword.isEmpty()) {
            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match!");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                return;
            }
        }

        try {
            Connection conn = dbconnection.getConnection();

            String sql;

            // If password is changed
            if (newPassword != null && !newPassword.isEmpty()) {
                sql = "UPDATE users SET first_name=?, last_name=?, password=? WHERE email=?";
            } else {
                sql = "UPDATE users SET first_name=?, last_name=? WHERE email=?";
            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);

            if (newPassword != null && !newPassword.isEmpty()) {
                ps.setString(3, newPassword);
                ps.setString(4, email);
            } else {
                ps.setString(3, email);
            }

            ps.executeUpdate();

            // Update session name
            session.setAttribute("username", firstName);

            conn.close();

            response.sendRedirect("profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
