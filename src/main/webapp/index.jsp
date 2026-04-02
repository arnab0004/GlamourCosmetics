<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/includes/header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Glamour Cosmetics - Premium Beauty Products</title>

  <!-- Corrected JSP Paths -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css">
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



  <!-- Hero Section -->
  <section class="hero">
    <div class="slideshow-container">

      <!-- Images now loaded correctly using JSP path -->
      <img class="slide" src="${pageContext.request.contextPath}/banner1.jpg" alt="Cosmetics Collection 1">
      <img class="slide" src="${pageContext.request.contextPath}/banner2.jpg" alt="Cosmetics Collection 2">
      <img class="slide" src="${pageContext.request.contextPath}/banner3.jpg" alt="Cosmetics Collection 3">

    </div>

    <div class="hero-content">
      <h1>Discover Your Natural Beauty</h1>
      <p>Premium quality cosmetics for every skin type. Shop our curated collection of skincare and makeup products.</p>
      <a href="products.jsp" class="btn-primary">Shop Now</a>
    </div>
  </section>

  <!-- Featured Products -->
  <section class="featured-products">
    <div class="container">
      <h2>Featured Products</h2>
      <div class="products-grid">

        <div class="product-card">
          <img src="${pageContext.request.contextPath}/Moisturizing.jpg" alt="Moisturizing Cream">
          <h3>Hydrating Face Cream</h3>
          <p class="price">729.99</p>
          <button class="btn-add-cart">Add to Cart</button>
        </div>

        <div class="product-card">
          <img src="${pageContext.request.contextPath}/lipstick.jpg" alt="Lipstick Set">
          <h3>Matte Lipstick Set</h3>
          <p class="price">824.99</p>
          <button class="btn-add-cart">Add to Cart</button>
        </div>

        <div class="product-card">
          <img src="${pageContext.request.contextPath}/Eye_Shadow.jpg" alt="Eye Shadow Palette">
          <h3>Eye Shadow Palette</h3>
          <p class="price">639.99</p>
          <button class="btn-add-cart">Add to Cart</button>
        </div>

      </div>

      <div class="button-container" style="text-align:center;">
        <a href="products.jsp" class="btn-primary">View All Products</a>
      </div>

    </div>
  </section>


  <!-- About Section -->
  <section class="about">
    <div class="container">
      <h2>Our Story</h2>
      <p>At Glamour Cosmetics, we believe beauty should be effortless, ethical, and empowering...</p>
    </div>
  </section>

  <!-- Testimonials -->
  <section class="testimonials">
    <div class="container">
      <h2>What Our Customers Say</h2>
      <div class="testimonial-grid">

        <div class="testimonial-card">
          <p>"The face cream is amazing! My skin feels soft and hydrated all day."</p>
          <span>- Sarah K.</span>
        </div>

        <div class="testimonial-card">
          <p>"The lipstick set is my favorite! The shades are beautiful and last long."</p>
          <span>- Priya M.</span>
        </div>

        <div class="testimonial-card">
          <p>"Love their products, and the best part is they are cruelty-free."</p>
          <span>- Emily R.</span>
        </div>

      </div>
    </div>
  </section>

  <!-- Newsletter -->
  <section class="newsletter">
    <div class="container">
      <h2>Stay Updated</h2>
      <p>Sign up for our newsletter to get the latest offers, beauty tips, and product launches.</p>
      <form class="newsletter-form">
        <input type="email" placeholder="Enter your email" required>
        <button type="submit" class="btn-primary">Subscribe</button>
      </form>
    </div>
  </section>

  <!-- Blog -->
  <section class="blog">
    <div class="container">
      <h2>Beauty Tips &amp; Guides</h2>
      <div class="blog-grid">

        <div class="blog-card">
          <img src="${pageContext.request.contextPath}/Routine.jpg" alt="Skincare Routine">
          <h3>5 Steps for Glowing Skin</h3>
          <p>Discover the perfect skincare routine that keeps your skin fresh and radiant.</p>
          <a href="blog.jsp" class="btn-secondary">Read More</a>
        </div>

        <div class="blog-card">
          <img src="${pageContext.request.contextPath}/Trend.jpg" alt="Makeup Trends">
          <h3>Top Makeup Trends of 2024</h3>
          <p>Stay ahead with the latest beauty trends taking over the fashion world.</p>
          <a href="blog.jsp" class="btn-secondary">Read More</a>
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

  <!-- Script -->
  <script src="${pageContext.request.contextPath}/script.js"></script>

</body>
</html>
