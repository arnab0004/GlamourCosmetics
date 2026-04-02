<%@ page import="java.sql.*, com.glamourcosmetics.database.dbconnection"%>

<h2>All Products</h2>

<table border="1" cellpadding="10">
	<tr>
		<th>Image</th>
		<th>Name</th>
		<th>Price</th>
		<th>Action</th>
	</tr>

	<%
	try (Connection conn = dbconnection.getConnection()) {
		String sql = "SELECT * FROM products";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
	%>
	<tr>
		<td><img
			src="<%=request.getContextPath()%>/images/<%=rs.getString("image")%>"
			width="80"></td>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getDouble("price")%>/-</td>
		<td>
			<form action="<%=request.getContextPath()%>/admin/delete-product" method="post" style="display:inline;">
    <input type="hidden" name="id" value="<%=rs.getInt("product_id")%>">
    <button type="submit" onclick="return confirm('Delete this product?')">
        Delete
    </button>
</form>

</td>
		
	</tr>
	<%
	}
	}
	%>
</table>
