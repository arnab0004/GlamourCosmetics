package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/my-orders")
public class OrderHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

        List<Map<String, Object>> orders = new ArrayList<>();

        String sql = "SELECT * FROM orders WHERE user_email = ? ORDER BY order_date DESC";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> order = new HashMap<>();
                order.put("orderId", rs.getInt("order_id"));
                order.put("total", rs.getDouble("total_amount"));
                order.put("date", rs.getTimestamp("order_date"));
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
