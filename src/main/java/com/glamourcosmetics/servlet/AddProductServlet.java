package com.glamourcosmetics.servlet;

import com.glamourcosmetics.database.dbconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@MultipartConfig
@WebServlet("/admin/add-product")
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        Part imagePart = request.getPart("image");
        String fileName = imagePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "images";
        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdir();

        imagePart.write(uploadPath + File.separator + fileName);

        String sql = "INSERT INTO products (name, price, image) VALUES (?, ?, ?)";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, fileName);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin/view-products.jsp");
    }
}
