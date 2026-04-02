package com.glamourcosmetics.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.glamourcosmetics.database.dbconnection;


@WebServlet("/admin/delete-product")
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = dbconnection.getConnection()) {

            String sql = "DELETE FROM products WHERE product_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/admin/view-products.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

