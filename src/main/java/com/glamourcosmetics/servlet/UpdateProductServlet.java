package com.glamourcosmetics.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import com.glamourcosmetics.database.dbconnection;


@WebServlet("/admin/update-product")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        Part imagePart = request.getPart("image");
        String fileName = imagePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "/images";
        imagePart.write(uploadPath + "/" + fileName);

        String sql =
            "UPDATE products SET name=?, price=?, image=? WHERE product_id=?";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, fileName);
            ps.setInt(4, productId);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin/view-products.jsp");
    }
}
