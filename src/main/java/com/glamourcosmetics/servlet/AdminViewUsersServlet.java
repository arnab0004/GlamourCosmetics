package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/admin/view-users")
public class AdminViewUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, String>> users = new ArrayList<>();

        try (Connection conn = dbconnection.getConnection()) {

            String sql = "SELECT first_name, last_name, email FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> user = new HashMap<>();
                user.put("firstName", rs.getString("first_name"));
                user.put("lastName", rs.getString("last_name"));
                user.put("email", rs.getString("email"));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/view-users.jsp").forward(request, response);
    }
}
