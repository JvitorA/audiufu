<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3 style="text-align:  center;">Product List</h3>

	<p style="color: red;">${errorString}</p>

	<table border="1" cellpadding="5" cellspacing="1" style=" width:  100%; text-align:  center; background-color: gainsboro;">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Price</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${productList}" var="product">
			<tr>
<!-- 			Insecure -->
<%-- 				<td>${product.code}</td> --%>
<%-- 				<td>${product.name}</td> --%>
<%-- 				<td>${product.price}</td> --%>
<!-- 				Secure -->
				<td><c:out value="${product.code}"/></td>
				<td><c:out value="${product.name}"/></td>
				<td><c:out value="${product.price}"/></td>
				<td><a href="editProduct?code=${product.code}">Edit</a></td>
				<td><a href="deleteProduct?code=${product.code}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>

	<a href="createProduct">Register Product</a>

	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>