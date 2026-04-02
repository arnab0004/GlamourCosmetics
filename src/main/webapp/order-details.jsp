<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.glamourcosmetics.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Details | Glamour Cosmetics</title>

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">

    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>

<body>

<jsp:include page="/includes/header.jsp" />

<section style="padding:130px 20px 60px; background:#f8f9fa; min-height:100vh;">
    <div class="container">

        <h2 style="margin-bottom:25px;">
            📦 Order Details (Order ID: ${orderId})
        </h2>

        <%
            List<CartItem> items = (List<CartItem>) request.getAttribute("items");
            double grandTotal = 0;
        %>

        <% if (items == null || items.isEmpty()) { %>
            <p>No items found for this order.</p>
        <% } else { %>

        <table style="
            width:100%;
            background:white;
            border-radius:12px;
            box-shadow:0 10px 30px rgba(0,0,0,.1);
            border-collapse:collapse;
        ">
            <tr style="background:#f1f3f5;">
                <th style="padding:15px;">Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>

            <% for (CartItem item : items) {
                double total = item.getPrice() * item.getQuantity();
                grandTotal += total;
            %>
            <tr style="text-align:center;">
                <td style="padding:15px;"><%= item.getName() %></td>
                <td>₹<%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>₹<%= total %></td>
            </tr>
            <% } %>
        </table>

        <h3 style="margin-top:25px;">
            💰 Grand Total: ₹<%= grandTotal %>
        </h3>

        <a href="profile.jsp" class="btn-primary" style="margin-top:20px; display:inline-block;">
            ← Back to Profile
        </a>

        <% } %>

    </div>
</section>

<footer class="footer">
    <div class="container">
        <div class="footer-bottom">
            <p>&copy; 2024 Glamour Cosmetics. All rights reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>
