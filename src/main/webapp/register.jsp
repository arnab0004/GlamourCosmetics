<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - Glamour Cosmetics</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="register.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
</head>
<body>

	<!-- Header -->
	<header class="header">
		<nav class="navbar">
			<div class="nav-brand">
				<span>Glamour Cosmetics</span>
			</div>

			<ul class="nav-menu">
				<li><a href="index.jsp" class="nav-link">Home</a></li>
				<li><a href="products.jsp" class="nav-link">Products</a></li>
				<li><a href="about.jsp" class="nav-link">About</a></li>
				<li><a href="contact.jsp" class="nav-link">Contact</a></li>
			</ul>

			<div class="nav-actions">
				<a href="login.jsp" class="btn-login">Login</a> <a href="cart.jsp"
					class="cart-icon"> <i class="fas fa-shopping-cart"></i> <span
					class="cart-count">0</span>
				</a>
			</div>
		</nav>
	</header>

	<!-- Register Section -->
	<section class="auth-section">
		<div class="container">
			<div class="auth-form">
				<h2>Create Your Account</h2>




				<!-- Form sends data to RegisterServlet -->
				<form action="${pageContext.request.contextPath}/register"
					method="post">

					<div class="form-row">
						<div class="form-group">
							<label for="firstName">First Name</label> <input type="text"
								id="firstName" name="firstName" required>
						</div>

						<div class="form-group">
							<label for="lastName">Last Name</label> <input type="text"
								id="lastName" name="lastName" required>
						</div>
					</div>

					<div class="form-group">
						<label for="regEmail">Email Address</label> <input type="email"
							id="regEmail" name="email" required>
					</div>

					<div class="form-group">
						<label for="regPassword">Password</label> <input type="password"
							id="regPassword" name="password" required>
					</div>

					<div class="form-group">
						<label for="confirmPassword">Confirm Password</label> <input
							type="password" id="confirmPassword" name="confirmPassword"
							required>
					</div>

					<div class="form-options">
						<label class="checkbox"> <input type="checkbox"
							name="terms" required> <span>I agree to the Terms
								and Conditions</span>
						</label> <label class="checkbox"> <input type="checkbox"
							name="newsletter"> <span>Subscribe to newsletter</span>
						</label>
					</div>

					<button type="submit" class="btn-primary">Create Account</button>
				</form>

				<p class="auth-switch">
					Already have an account? <a href="login.jsp">Login here</a>
				</p>
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
