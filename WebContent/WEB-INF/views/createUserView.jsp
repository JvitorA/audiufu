<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Product</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3>Create Product</h3>

	<p style="color: red;">${errorString}</p>

	<form method="POST"
		action="${pageContext.request.contextPath}/createUser">
		<table border="0">
			<tr>
				<td>Username</td>
				<td><input type="text" name="name" value="${user.username}" /></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
				  	<input type="radio" name="gender" value="M"> Male<br>
  					<input type="radio" name="gender" value="F"> Female<br>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password" value="${user.password}" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /> <a
					href="productList">Cancel</a></td>
			</tr>
		</table>
	</form>

	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>