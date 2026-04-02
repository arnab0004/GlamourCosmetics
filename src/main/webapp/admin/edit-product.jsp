<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form action="${pageContext.request.contextPath}/admin/update-product"
      method="post"
      enctype="multipart/form-data">

  <input type="hidden" name="id" value="${product.product_id}">

  <input type="text" name="name" value="${product.name}" required>
  <input type="number" step="0.01" name="price" value="${product.price}" required>

  <input type="file" name="image">

  <button type="submit">Update</button>
</form>
			
</body>
</html>