package com.glamourcosmetics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.glamourcosmetics.database.*; 

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String email     = request.getParameter("email");
        String password  = request.getParameter("password");
        String confirm   = request.getParameter("confirmPassword");

        // ✅ Basic validation
        if (firstName == null || email == null || password == null ||
            confirm == null || firstName.isEmpty() || email.isEmpty()) {

            response.sendRedirect("register.jsp?error=missing");
            return;
        }

        // ✅ Password match check
        if (!password.equals(confirm)) {
            response.sendRedirect("register.jsp?error=nomatch");
            return;
        }

        String sql =
            "INSERT INTO users(first_name, last_name, email, password) VALUES (?, ?, ?, ?)";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, password); // (later we’ll hash)

            ps.executeUpdate();

            // ✅ SUCCESS
            response.sendRedirect("login.jsp?registered=true");

        } catch (Exception e) {
            e.printStackTrace();
            // most likely duplicate email
            response.sendRedirect("register.jsp?error=exists");
        }
    }
}

