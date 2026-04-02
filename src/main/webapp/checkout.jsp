<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, com.glamourcosmetics.model.CartItem"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Checkout | Glamour Cosmetics</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/checkout.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>

<body>

<!-- HEADER -->
<jsp:include page="/includes/header.jsp" />

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    double subtotal = 0;
    double shipping = 50;

    if (cart != null) {
        for (CartItem item : cart) {
            subtotal += item.getPrice() * item.getQuantity();
        }
    }

    double totalAmount = subtotal + shipping;

    // Razorpay needs amount in paise
    int razorpayAmount = (int) (totalAmount * 100);
%>

<section class="checkout-section">
    <div class="container">
        <h2>Checkout</h2>

        <% if (cart == null || cart.isEmpty()) { %>
            <p>Your cart is empty.</p>
            <a href="products.jsp" class="btn-primary">Shop Now</a>
        <% } else { %>

        <div class="checkout-content">

            <!-- SHIPPING -->
            <div class="checkout-form">
                <h3>Shipping Information</h3>

                <form>
                    <div class="form-row">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" required>
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Shipping Address</label>
                        <input type="text" required>
                    </div>

                    <button type="button" id="payBtn" class="btn-primary">
                        Pay ₹<%= totalAmount %>
                    </button>
                </form>
            </div>

            <!-- ORDER SUMMARY -->
            <div class="order-summary">
                <h3>Order Summary</h3>

                <div class="summary-items">
                    <% for (CartItem item : cart) { %>
                        <div class="summary-item">
                            <span><%= item.getName() %> × <%= item.getQuantity() %></span>
                            <span>₹<%= item.getPrice() * item.getQuantity() %></span>
                        </div>
                    <% } %>
                </div>

                <div class="summary-total">
                    <div class="summary-row">
                        <span>Subtotal</span>
                        <span>₹<%= subtotal %></span>
                    </div>
                    <div class="summary-row">
                        <span>Shipping</span>
                        <span>₹<%= shipping %></span>
                    </div>
                    <div class="summary-row total">
                        <span>Total</span>
                        <span>₹<%= totalAmount %></span>
                    </div>
                </div>
            </div>

        </div>
        <% } %>
    </div>
</section>

<!-- RAZORPAY -->
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
document.getElementById("payBtn").onclick = function (e) {
    e.preventDefault();

    var options = {
        "key": "rzp_test_Rrx5YFD655ZoHw",   // KEY ID only
        "amount": "<%= razorpayAmount %>",
        "currency": "INR",
        "name": "Glamour Cosmetics",
        "description": "Order Payment",
        "handler": function (response) {
            // ✅ Redirect to PaymentSuccessServlet
            window.location.href =
                "<%=request.getContextPath()%>/payment-success?payment_id=" 
                + response.razorpay_payment_id;
        },
        "theme": {
            "color": "#ff6b6b"
        }
    };

    var rzp = new Razorpay(options);
    rzp.open();
};
</script>


</body>
</html>
