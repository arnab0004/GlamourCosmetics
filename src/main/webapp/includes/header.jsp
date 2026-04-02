<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="header">
  <nav class="navbar">
    <div class="nav-brand">
      <span>Glamour Cosmetics</span>
    </div>

    <ul class="nav-menu">
      <li><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/products.jsp" class="nav-link">Products</a></li>
      <li><a href="${pageContext.request.contextPath}/about.jsp" class="nav-link">About</a></li>
      <li><a href="${pageContext.request.contextPath}/contact.jsp" class="nav-link">Contact</a></li>
    </ul>

   <div class="nav-actions">

  <c:choose>
    <c:when test="${not empty sessionScope.username}">
      <!-- Profile link (username clickable) -->
      <a href="${pageContext.request.contextPath}/profile.jsp"
         class="btn-login">
        Hi, ${sessionScope.username}
      </a>

      <!-- Logout -->
      <a href="${pageContext.request.contextPath}/LogoutServlet"
         class="btn-register"
         style="margin-left:8px;">
        Logout
      </a>
    </c:when>

    <c:otherwise>
      <!-- Login / Register -->
      <a href="${pageContext.request.contextPath}/login.jsp"
         class="btn-login">Login</a>

      <a href="${pageContext.request.contextPath}/register.jsp"
         class="btn-register"
         style="margin-left:8px;">Register</a>
    </c:otherwise>
  </c:choose>

  <!-- 🛒 CART (always visible) -->
  <a href="${pageContext.request.contextPath}/cart.jsp"
     class="cart-icon"
     style="margin-left:12px;">
    <i class="fas fa-shopping-cart"></i>
    <span class="cart-count">
      ${sessionScope.cartCount != null ? sessionScope.cartCount : 0}
    </span>
  </a>

</div>


  </nav>
</header>
