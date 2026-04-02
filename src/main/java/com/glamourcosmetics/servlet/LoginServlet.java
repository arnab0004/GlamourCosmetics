package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.*; // ensure dbconnection class/package is correct

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // basic null/empty check (optional but helpful)
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Please enter email and password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String sql = "SELECT first_name FROM users WHERE email = ? AND password = ?";

        // use try-with-resources so resources are closed automatically
        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("first_name"); // use the actual column name once

                    // set session attribute once
                    HttpSession session = request.getSession(true);
                    session.setAttribute("username", name);
                    session.setAttribute("userEmail", email);

                    System.out.println("Login success for: " + email + " => displayName: " + name);

                    // redirect to dashboard (context path + JSP at webapp root)
                    response.sendRedirect(request.getContextPath() + "/profile.jsp");
                    return;
                } else {
                    request.setAttribute("error", "Invalid email or password!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }
            }

        } catch (Exception e) {
            // print stacktrace to server console for debugging
            e.printStackTrace();
            // show a simple friendly error page/message (avoid showing stacktraces to users)
            request.setAttribute("error", "Server error. Check logs.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
