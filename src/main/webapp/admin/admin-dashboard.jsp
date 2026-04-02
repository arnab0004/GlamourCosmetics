<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession sessionAdmin = request.getSession(false);
if (sessionAdmin == null || sessionAdmin.getAttribute("admin") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style.css">
</head>
<body>

	<h2>Welcome Admin</h2>

	<ul>
		<li><a
			href="${pageContext.request.contextPath}/admin/view-orders"
			class="btn-primary"> View Orders </a></li>
		<li><a href="${pageContext.request.contextPath}/admin/view-users"
			class="btn-primary">View All Users</a></li>
		<li><a
			href="${pageContext.request.contextPath}/admin/add-product.jsp"
			class="btn-primary"> Manage Products </a></li>

		<li><a href="../admin-logout">Logout</a></li>
	</ul>

</body>
</html>
