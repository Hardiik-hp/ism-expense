<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Expense</title>
</head>
<style>
body{
		    counter-reset: Serial;          
		}
		tr td:first-child:before
		{
		  counter-increment: Serial;      
		  content: counter(Serial); 
		}
</style>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div>
<h2>View All Expense</h2>
<br></div>
	<table border="1">
		<tr>
			<th>Sr No</th>
			<th>Name</th>
			<th>Description</th>
			<th>Amount</th>
			<th>Date</th>
			<th>Time</th>
			<th>Payment Type</th>
		</tr>
		<c:forEach items="${items}" var="i">
			<tr>
				<td scope="row"></td>
				<td>${i.expName}</td>
				<td>${i.expDescription}</td>
				<td>${i.expAmount}</td>
				<td>${i.expDate}</td>
				<td>${i.expTime}</td>
				<td>${i.paymentType}</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>