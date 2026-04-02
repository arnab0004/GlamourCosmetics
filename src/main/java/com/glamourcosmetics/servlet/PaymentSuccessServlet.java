package com.glamourcosmetics.servlet;

import com.glamourcosmetics.model.CartItem;
import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

@WebServlet("/payment-success")
public class PaymentSuccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("cart") == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Payment ID from Razorpay
        String paymentId = request.getParameter("payment_id");

        // Logged-in user email
        String userEmail = (String) session.getAttribute("userEmail");

        // Cart items
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        double shipping = 50;
        double totalAmount = shipping;

        for (CartItem item : cart) {
            totalAmount += item.getPrice() * item.getQuantity();
        }


        try (Connection conn = dbconnection.getConnection()) {

            // 1️⃣ Save order
            String orderSql =
                "INSERT INTO orders (user_email, total_amount) VALUES (?, ?)";

            PreparedStatement orderPs =
                conn.prepareStatement(orderSql, PreparedStatement.RETURN_GENERATED_KEYS);

            orderPs.setString(1, userEmail);
            orderPs.setDouble(2, totalAmount);
            orderPs.executeUpdate();

            ResultSet rs = orderPs.getGeneratedKeys();
            rs.next();
            int orderId = rs.getInt(1);

            // 2️⃣ Save order items
         // 2️⃣ Insert order items (FIXED)
            String itemSql =
                "INSERT INTO order_items (order_id, product_name, price, quantity) " +
                "VALUES (?, ?, ?, ?)";

            PreparedStatement itemPs = conn.prepareStatement(itemSql);

            for (CartItem item : cart) {
                itemPs.setInt(1, orderId);
                itemPs.setString(2, item.getName());
                itemPs.setDouble(3, item.getPrice());
                itemPs.setInt(4, item.getQuantity());
                itemPs.addBatch();
            }

            itemPs.executeBatch();


            // 3️⃣ Clear cart
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);

            // 4️⃣ Redirect to profile
            response.sendRedirect("profile.jsp?order=success&payment=" + paymentId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkout.jsp?error=payment");
        }
    }
}
