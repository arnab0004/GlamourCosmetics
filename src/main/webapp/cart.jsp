<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, com.glamourcosmetics.model.CartItem"%>

<!DOCTYPE html>
<html>
<head>
<title>My Cart | Glamour Cosmetics</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
</head>

<body>

	<jsp:include page="/includes/header.jsp" />

	<section class="cart-section">
		<div class="container">
			<h2>🛒 My Cart</h2>

			<%
			List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
			double grandTotal = 0;
			%>

			<%
			if (cart == null || cart.isEmpty()) {
			%>
			<p>Your cart is empty 😕</p>
			<a href="products.jsp" class="btn-primary">Shop Now</a>
			<%
			} else {
			%>

			<table
				style="width: 100%; background: white; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1);">
				<tr style="background: #f8f9fa;">
					<th style="padding: 15px;">Product</th>
					<th>Price</th>
					<th>Qty</th>
					<th>Total</th>
					<th>Action</th>
				</tr>

				<%
				for (CartItem item : cart) {
					double total = item.getPrice() * item.getQuantity();
					grandTotal += total;
				%>
				<tr>
					<td style="padding: 15px;"><%=item.getName()%></td>
					<td>₹<%=item.getPrice()%></td>
					<td><a
						href="update-cart?productId=<%=item.getProductId()%>&action=dec"
						class="quantity-btn">−</a> <span class="quantity"><%=item.getQuantity()%></span>

						<a
						href="update-cart?productId=<%=item.getProductId()%>&action=inc"
						class="quantity-btn">+</a></td>

					<td>₹<%=total%></td>
					<td><a
						href="remove-from-cart?productId=<%=item.getProductId()%>"
						class="btn-danger">Remove</a></td>
				</tr>
				<%
				}
				%>
			</table>

			<h3 style="margin-top: 20px;">
				Grand Total: ₹<%=grandTotal%></h3>

			<a href="checkout.jsp?amount=<%=grandTotal%>" class="btn-primary"
				style="margin-top: 20px;"> Checkout </a>


			<%
			}
			%>
		</div>
	</section>

</body>
</html>
