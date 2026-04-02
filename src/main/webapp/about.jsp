<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/includes/header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Glamour Cosmetics</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
<% if (username != null) { %>
    <span style="font-weight:600;">Hi, <%= username %></span>
    <a href="<%= request.getContextPath() %>/logout" class="btn-login">Logout</a>
<% } else { %>
    <a href="login.jsp" class="btn-login">Login</a>
<% } %>

    <a href="cart.jsp" class="cart-icon">
        <i class="fas fa-shopping-cart"></i>
        <span class="cart-count">0</span>
    </a>
</div>



    <!-- About Section -->
    <section class="about-section">
        <div class="container">
            <h2 style="text-align: center;">About Glamour Cosmetics</h2><br>
            <div class="about-content">
                <div class="about-text">
                    <h3>Our Story</h3>
                    <p>Founded in 2010, Glamour Cosmetics has been dedicated to providing high-quality beauty products that enhance natural beauty while promoting skin health. Our journey began with a simple mission: to create cosmetics that are both effective and gentle on the skin.</p>
                    <p>We believe that everyone deserves to feel confident and beautiful in their own skin. That's why we use only the finest ingredients, carefully selected for their quality and effectiveness.</p>
                    
                    <h3>Our Values</h3>
                    <ul>
                        <li><strong>Quality:</strong> We never compromise on the quality of our products</li>
                        <li><strong>Sustainability:</strong> We're committed to eco-friendly practices</li>
                        <li><strong>Innovation:</strong> Constantly researching and developing new formulas</li>
                        <li><strong>Customer Care:</strong> Your satisfaction is our top priority</li>
                    </ul>
                </div>

                <div class="about-image">
                    <img src="about.jpg" alt="About Glamour Cosmetics">
                </div>
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
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
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
