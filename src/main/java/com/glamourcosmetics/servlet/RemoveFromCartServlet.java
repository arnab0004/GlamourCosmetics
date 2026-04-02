package com.glamourcosmetics.servlet;

import com.glamourcosmetics.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession(false);

        if (session != null) {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

            if (cart != null) {
                Iterator<CartItem> iterator = cart.iterator();
                int totalQty = 0;

                while (iterator.hasNext()) {
                    CartItem item = iterator.next();

                    if (item.getProductId() == productId) {
                        iterator.remove();
                    } else {
                        totalQty += item.getQuantity();
                    }
                }

                session.setAttribute("cart", cart);
                session.setAttribute("cartCount", totalQty);
            }
        }

        response.sendRedirect("cart.jsp");
    }
}
