<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/includes/header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Glamour Cosmetics</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="contact.css">
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



    <!-- Contact Section -->
    <section class="contact-section">
        <div class="container">

            <h2>Contact Us</h2>

            <div class="contact-content">

                <!-- Contact Info -->
                <div class="contact-info">
                    <h3>Get in Touch</h3>

                    <div class="contact-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <div>
                            <h4>Address</h4>
                            <p>123 Beauty Street, Cosmetic City, CC 12345</p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <i class="fas fa-phone"></i>
                        <div>
                            <h4>Phone</h4>
                            <p>+1 (555) 123-4567</p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <i class="fas fa-envelope"></i>
                        <div>
                            <h4>Email</h4>
                            <p>info@glamourcosmetics.com</p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <i class="fas fa-clock"></i>
                        <div>
                            <h4>Business Hours</h4>
                            <p>Monday - Friday: 9AM - 6PM</p>
                            <p>Saturday: 10AM - 4PM</p>
                            <p>Sunday: Closed</p>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="contact-form">
                    <h3>Send us a Message</h3>

                    <form id="contactForm">
                        <div class="form-row">

                            <div class="form-group">
                                <label for="contactName">Full Name</label>
                                <input type="text" id="contactName" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="contactEmail">Email Address</label>
                                <input type="email" id="contactEmail" name="email" required>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="contactSubject">Subject</label>
                            <input type="text" id="contactSubject" name="subject" required>
                        </div>

                        <div class="form-group">
                            <label for="contactMessage">Message</label>
                            <textarea id="contactMessage" name="message" rows="5" required></textarea>
                        </div>

                        <button type="submit" class="btn-primary">Send Message</button>

                    </form>
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
