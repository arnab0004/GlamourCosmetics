package com.glamourcosmetics.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.glamourcosmetics.model.CartItem;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // optional, removes warning

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        // ✅ Read product data
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        // ✅ Get cart from session
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // ✅ Check if product already exists
        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProductId() == productId) {
                item.setQuantity(item.getQuantity() + 1);
                found = true;
                break;
            }
        }

        // ✅ Add new item if not found
        if (!found) {
            cart.add(new CartItem(
                    productId,
                    productName,
                    price,
                    1,
                    image
            ));
        }

        // ✅ Save cart
        session.setAttribute("cart", cart);

        // ✅ Update cart count
        int totalQty = 0;
        for (CartItem item : cart) {
            totalQty += item.getQuantity();
        }
        session.setAttribute("cartCount", totalQty);

        // ✅ Redirect back
        response.sendRedirect("products.jsp");
    }
}
