<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Orders | Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
</head>

<body>



<div class="container" style="padding:120px 20px;">

    <h2>All Orders</h2>

    <c:choose>
        <c:when test="${empty orders}">
            <p>No orders found.</p>
        </c:when>

        <c:otherwise>
            <table style="width:100%; background:white; border-radius:10px; box-shadow:0 10px 30px rgba(0,0,0,.1);">
                <tr style="background:#f1f1f1;">
                    <th style="padding:12px;">Order ID</th>
                    <th>User Email</th>
                    <th>Total Amount</th>
                    <th>Order Date</th>
                </tr>

                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td style="padding:12px;">#${order.orderId}</td>
                        <td>${order.userEmail}</td>
                        <td>₹${order.total}</td>
                        <td>${order.date}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>

    <br>
    <a href="admin-dashboard.jsp" class="btn-primary">⬅ Back to Dashboard</a>

</div>

</body>
</html>
