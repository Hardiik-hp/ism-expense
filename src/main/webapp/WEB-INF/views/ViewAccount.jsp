<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Account</title>
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
	<h2>View Account</h2>
	<table border="1">
		<tr>
			<th>Sr No.</th>
			<th>Account Type</th>
			<th>Balance</th>
			<th>Card Number</th>
			<th>UPI ID</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${accounts }" var="a">
		<tr>
			<td scope="row"></td>
			<td>${a.accountType }</td>
			<td>${a.balance }</td>
			<td>${a.cardNumber }</td>
			<td>${a.upiId }</td>
			<td></td>
		</tr>
		</c:forEach>


	</table>
</body>
</html>