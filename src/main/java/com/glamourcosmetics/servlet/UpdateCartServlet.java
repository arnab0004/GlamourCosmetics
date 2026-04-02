package com.glamourcosmetics.servlet;

import com.glamourcosmetics.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);

        if (session != null) {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart != null) {
                int totalQty = 0;

                for (CartItem item : cart) {
                    if (item.getProductId() == productId) {
                        if ("inc".equals(action)) {
                            item.setQuantity(item.getQuantity() + 1);
                        } else if ("dec".equals(action) && item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        }
                    }
                    totalQty += item.getQuantity();
                }

                session.setAttribute("cart", cart);
                session.setAttribute("cartCount", totalQty);
            }
        }

        response.sendRedirect("cart.jsp");
    }
}
