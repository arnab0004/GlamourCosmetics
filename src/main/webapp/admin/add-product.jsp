<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Add Product</h2>

<form action="${pageContext.request.contextPath}/admin/add-product"
      method="post"
      enctype="multipart/form-data">
	<label>Product Name</label><br>
    <input type="text" name="name" placeholder="Product Name" required>
    <br>
	<br>
	<label>Price</label><br>
    <input type="number" name="price" step="0.01" required>
	<br>
	<br>
	<label>Image filename (example: product.jpg)</label><br>
    <input type="file" name="image" required>
	<br>
	<br>
    <button type="submit">Add Product</button>
</form>


<br>
<a href="${pageContext.request.contextPath}/admin/view-products.jsp">
    View Products
</a>



