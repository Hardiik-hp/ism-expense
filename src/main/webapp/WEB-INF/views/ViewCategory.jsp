<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Category</title>
</head>
<style>
body {
	counter-reset: Serial;
}

tr td:first-child:before {
	counter-increment: Serial;
	content: counter(Serial);
}
</style>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>View Category</h2> <br>
	<table border="1">
	<tr>
	<th>Sr No</th>
	<th>Category</th>
	<th>User Id</th>
	<c:forEach items="${listCategory}" var="c">
	<tr>
	<td></td>
	<td>${c.category}</td>
	<td>${c.userId}</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>