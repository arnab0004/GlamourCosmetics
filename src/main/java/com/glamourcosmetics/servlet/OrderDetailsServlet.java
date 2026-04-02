package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;
import com.glamourcosmetics.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        List<CartItem> items = new ArrayList<>();

        try (Connection conn = dbconnection.getConnection()) {

            String sql =
                "SELECT product_name, price, quantity FROM order_items WHERE order_id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
            	CartItem item = new CartItem(
            		    0, // dummy productId (not used)
            		    rs.getString("product_name"),
            		    rs.getDouble("price"),
            		    rs.getInt("quantity"),
            		    null // image not stored
            		);
                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("items", items);
        request.setAttribute("orderId", orderId);

        request.getRequestDispatcher("order-details.jsp").forward(request, response);
    }
}
