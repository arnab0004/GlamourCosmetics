<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.glamourcosmetics.database.dbconnection"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<jsp:include page="/includes/header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products - Glamour Cosmetics</title>
<link rel="stylesheet" href="style.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- Header -->

	<%
	HttpSession sessionObj = request.getSession(false);
	String username = null;
	if (sessionObj != null) {
		username = (String) sessionObj.getAttribute("username");
	}
	%>

	<div class="nav-actions">
		<%
		if (username != null) {
		%>
		<span style="font-weight: 600;">Hi, <%=username%></span> <a
			href="<%=request.getContextPath()%>/logout" class="btn-login">Logout</a>
		<%
		} else {
		%>
		<a href="login.jsp" class="btn-login">Login</a>
		<%
		}
		%>

		<a href="cart.jsp" class="cart-icon"> <i
			class="fas fa-shopping-cart"></i> <span class="cart-count">0</span>
		</a>
	</div>



	<!-- Products Section -->
	<section class="products-section">
		<div class="container">
			<h2>Our Products</h2>
			<div class="products-grid">

				<%
				try (Connection conn = dbconnection.getConnection()) {

					String sql = "SELECT * FROM products ORDER BY created_at DESC";
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();

					while (rs.next()) {
				%>

				<div class="product-card">
					<img
						src="<%=request.getContextPath()%>/images/<%=rs.getString("image")%>"
						alt="<%=rs.getString("name")%>">

					<h3><%=rs.getString("name")%></h3>
					<p class="price">
						₹<%=rs.getDouble("price")%></p>

					<form action="<%=request.getContextPath()%>/add-to-cart"
						method="post">
						<input type="hidden" name="productId"
							value="<%=rs.getInt("product_id")%>"> <input
							type="hidden" name="productName"
							value="<%=rs.getString("name")%>"> <input type="hidden"
							name="price" value="<%=rs.getDouble("price")%>"> <input
							type="hidden" name="image" value="<%=rs.getString("image")%>">

						<button type="submit" class="btn-add-cart">Add to Cart</button>
					</form>
				</div>

				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

			</div>

		</div>
	</section>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="footer-content">
				<div class="footer-section">
					<h4>Glamour Cosmetics</h4>
					<p>Premium beauty products for everyone.</p>
				</div>

				<div class="footer-section">
					<h4>Quick Links</h4>
					<ul>
						<li><a href="products.jsp">Products</a></li>
						<li><a href="about.jsp">About Us</a></li>
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</div>

				<div class="footer-section">
					<h4>Follow Us</h4>
					<div class="social-links">
						<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
							class="fab fa-instagram"></i></a> <a href="#"><i
							class="fab fa-twitter"></i></a>
					</div>
				</div>

			</div>

			<div class="footer-bottom">
				<p>&copy; 2024 Glamour Cosmetics. All rights reserved.</p>
			</div>
		</div>
	</footer>

	<script src="script.js"></script>
</body>
</html>
