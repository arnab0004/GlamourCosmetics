package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;
import com.glamourcosmetics.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("cart") == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String paymentId = request.getParameter("payment_id");
        if (paymentId == null || paymentId.isEmpty()) {
            response.sendRedirect("checkout.jsp?payment=failed");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        double totalAmount = 0;
        for (CartItem item : cart) {
            totalAmount += item.getPrice() * item.getQuantity();
        }
        totalAmount += 50; // shipping

        try (Connection conn = dbconnection.getConnection()) {

            /* =====================
               1️⃣ SAVE ORDER
            ===================== */
            String orderSql =
                "INSERT INTO orders(user_email, total_amount, order_date, payment_id) " +
                "VALUES (?, ?, NOW(), ?)";

            PreparedStatement orderPs =
                conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);

            orderPs.setString(1, userEmail);
            orderPs.setDouble(2, totalAmount);
            orderPs.setString(3, paymentId);
            orderPs.executeUpdate();

            ResultSet rs = orderPs.getGeneratedKeys();
            rs.next();
            int orderId = rs.getInt(1);

            /* =====================
               2️⃣ SAVE ORDER ITEMS
            ===================== */
            String itemSql =
                "INSERT INTO order_items(order_id, product_id, product_name, price, quantity, image) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement itemPs = conn.prepareStatement(itemSql);

            for (CartItem item : cart) {
                itemPs.setInt(1, orderId);
                itemPs.setInt(2, item.getProductId());
                itemPs.setString(3, item.getName());
                itemPs.setDouble(4, item.getPrice());
                itemPs.setInt(5, item.getQuantity());
                itemPs.setString(6, item.getImage());
                itemPs.addBatch();
            }

            itemPs.executeBatch();

            /* =====================
               3️⃣ CLEAR CART
            ===================== */
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);

            response.sendRedirect("profile.jsp?order=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkout.jsp?error");
        }
    }
}
