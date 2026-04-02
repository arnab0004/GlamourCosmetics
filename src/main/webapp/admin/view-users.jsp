<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Users | Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>
<body>


<div class="container" style="padding:40px;">
    <h2>👥 All Registered Users</h2>

    <table border="1" cellpadding="10" style="width:100%; margin-top:20px;">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
        </tr>

        <c:forEach var="u" items="${users}">
            <tr>
                <td>${u.firstName}</td>
                <td>${u.lastName}</td>
                <td>${u.email}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    
    <a href="admin-dashboard.jsp" class="btn-primary">⬅ Back to Dashboard</a>
</div>

</body>
</html>
