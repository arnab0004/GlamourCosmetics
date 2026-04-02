<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>

<h2 style="text-align:center;">Admin Login</h2>

<form action="${pageContext.request.contextPath}/admin-login" method="post">

    <label>Email</label>
    <input type="email" name="email" required>

    <label>Password</label>
    <input type="password" name="password" required>

    <button type="submit">Login</button>
</form>


</body>
</html>
