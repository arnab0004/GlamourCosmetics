<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile | Glamour Cosmetics</title>

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>

<body>

<%
    HttpSession sessionObj = request.getSession(false);
    String username = null;
    if (sessionObj != null) {
        username = (String) sessionObj.getAttribute("username");
    }
%>

<!-- HEADER -->
<jsp:include page="/includes/header.jsp" />

<!-- EDIT PROFILE -->
<section class="auth-section">
    <div class="container">
        <div class="auth-form">

            <h2>Edit Profile</h2>

            <form action="UpdateProfileServlet" method="post">

                <div class="form-row">
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" name="firstName"
                               value="${firstName}" required>
                    </div>

                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="lastName"
                               value="${lastName}" required>
                    </div>
                </div>

                <!-- Change Password -->
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword">
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label>Confirm New Password</label>
                    <input type="password" name="confirmPassword">
                </div>

                <button type="submit" class="btn-primary">
                    Update Profile
                </button>
            </form>

            <p class="auth-switch" style="margin-top:15px;">
                <a href="profile.jsp">← Back to Profile</a>
            </p>

        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="footer">
    <div class="container">
        <p style="text-align:center;">© 2024 Glamour Cosmetics</p>
    </div>
</footer>

</body>
</html>
