<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>My Profile | Glamour Cosmetics</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
</head>

<body>

	<%
	HttpSession sessionUser = request.getSession(false);
	if (sessionUser == null || sessionUser.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	String username = (String) sessionUser.getAttribute("username");
	%>

	<!-- HEADER -->
	<jsp:include page="/includes/header.jsp" />

	<!-- PROFILE SECTION -->
	<section
		style="padding: 130px 20px 60px; background: #f8f9fa; min-height: 100vh;">
		<div class="container">

			<!-- Welcome Card -->
			<div
				style="background: white; padding: 30px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1); margin-bottom: 40px; text-align: center;">
				<h2>
					Welcome, <span style="color: #ff6b6b;"><%=username%></span>
				</h2>
				<p style="color: #555; margin-top: 10px;">Manage your account,
					orders and personal details</p>
			</div>

			<!-- ACTION BOXES -->
			<div
				style="display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 25px;">

				<!-- My Orders -->
				<div
					style="background: white; padding: 25px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1); text-align: center;">
					<i class="fas fa-box" style="font-size: 2.5rem; color: #ff6b6b;"></i>
					<h3 style="margin: 15px 0;">My Orders</h3>
					<p style="color: #666;">View your order history</p>
					<a href="my-orders" class="btn-primary">View Orders</a>
				</div>

				<!-- Cart -->
				<div
					style="background: white; padding: 25px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1); text-align: center;">
					<i class="fas fa-shopping-cart"
						style="font-size: 2.5rem; color: #4ecdc4;"></i>
					<h3 style="margin: 15px 0;">My Cart</h3>
					<p style="color: #666;">Items ready for checkout</p>
					<a href="cart.jsp" class="btn-primary">Go to Cart</a>
				</div>

				<!-- Edit Profile -->
				<div
					style="background: white; padding: 25px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1); text-align: center;">
					<i class="fas fa-user" style="font-size: 2.5rem; color: #45b7d1;"></i>
					<h3 style="margin: 15px 0;">My Profile</h3>
					<p style="color: #666;">Update your details</p>
					<a href="editprofile.jsp" class="btn-primary">Edit Profile</a>
				</div>

				<!-- Logout -->
				<div
					style="background: white; padding: 25px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1); text-align: center;">
					<i class="fas fa-sign-out-alt"
						style="font-size: 2.5rem; color: #d63031;"></i>
					<h3 style="margin: 15px 0;">Logout</h3>
					<p style="color: #666;">End your session safely</p>
					<a href="LogoutServlet" class="btn-danger">Logout</a>
				</div>


			</div>

			<!-- ORDER HISTORY TABLE -->
			<div style="margin-top: 50px;">
				<h3>Order History</h3>

				<c:choose>
					<c:when test="${empty orders}">
						<p style="margin-top: 15px;">You have no orders yet.</p>
					</c:when>

					<c:otherwise>
						<table
							style="width: 100%; margin-top: 20px; background: white; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, .1);">
							<tr style="background: #f1f1f1;">
								<th style="padding: 12px;">Order ID</th>
								<th>Date</th>
								<th>Total</th>
							</tr>

							<c:forEach var="order" items="${orders}">
								<tr>
									<td style="padding: 12px;">#${order.orderId}</td>
									<td>${order.date}</td>
									<td>₹${order.total}</td>
									<td><a href="order-details?orderId=${order.orderId}"
										class="btn-secondary"> View Details </a></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</section>

	<!-- FOOTER -->
	<footer class="footer">
		<div class="container">
			<div class="footer-bottom">
				<p>&copy; 2024 Glamour Cosmetics. All rights reserved.</p>
			</div>
		</div>
	</footer>

</body>
</html>
