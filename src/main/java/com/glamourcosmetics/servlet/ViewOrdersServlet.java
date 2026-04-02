package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/admin/view-orders")
public class ViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Admin session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
            return;
        }

        List<Map<String, Object>> orders = new ArrayList<>();

        String sql = "SELECT order_id, user_email, total_amount, order_date FROM orders ORDER BY order_date DESC";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> order = new HashMap<>();
                order.put("orderId", rs.getInt("order_id"));
                order.put("userEmail", rs.getString("user_email"));
                order.put("total", rs.getDouble("total_amount"));
                order.put("date", rs.getTimestamp("order_date"));
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/view-orders.jsp").forward(request, response);
    }
}
