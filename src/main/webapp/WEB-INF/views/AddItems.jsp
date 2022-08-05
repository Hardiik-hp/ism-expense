<%@page import="com.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Expense</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>Add Expense</h2>
	<f:form action="addItem" method="post" modelAttribute="items">
		<div>
			Expense Name :
			<f:input path="expName" />
			<br><br>
		</div>
		<div>
			Expense Description :
			<f:input path="expDescription" />
			<br><br>
		</div>
		<div>
			Category :
			<f:select path="categoryId">
				<c:forEach items="${categories}" var="c">
					<f:option value="${c.categoryId}">${c.category }</f:option>
				</c:forEach>
			</f:select>
			<br><br>
		</div>
		<div>
			Sub Category :
			 <f:select path="subCategoryId" id="subcategoryid">
				<c:forEach items="${subcategory}" var="s">
					<f:option value="${s.subcategory_id}">${s.subcategory_name}</f:option>
				</c:forEach>
			</f:select> 
			<%-- <f:select path="subCategoryId">
				<%for(SubCategoryBean s:subcategory) %>
					<f:option value="${s.subcategory_id}">${s.subcategory_name}</f:option>
				
			</f:select> --%>
			<br><br>
		</div>
		<div>
			payment Type :
			<f:select path="paymentType" id="type">
				<c:forEach items="${account}" var="i">
					<f:option value="${i.accountType}">${i.accountType }</f:option>
				</c:forEach>
			</f:select>
			<br><br>
		</div>
		<div id="cardno">
			Card Number :
			<f:input path="cardNumber" />
			<br><br>
		</div>
		<div id="upiid">
			UPI ID :
			<f:input path="upiId" />
			<br><br>
		</div>
		<div>
			Expense Amount :
			<f:input path="expAmount" />
			<br><br>
		</div>
		<div>
			Expense Date : <input type="date" name="expDate" /><br>
			<br>
		</div>
		<div>
			Expense Time : <input type="time" name="expTime"><br>
			<br>
		</div>
		<input type="submit" value="Add Items">
	</f:form>
<!-- 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document)
			.ready(
				function () {
					$("#categories")
						.click(
							function () {
								let categoryid = document.getElementById("categories").value;
								let url = "http://localhost:9696/subcategory/"+ categoryid;
								$.get(url).done(function (data) {
											let subcategory = $("#subcategoryid");
											subcategory.empty();
											for (let i = 0; i < data.length; i++) {
												subcategory.append("<option value=" + data[i].subCategoryId + ">"+ data[i].subCategoryName+ "</option>");
											}
										})
									.fail(function () {
											console.log("something went wrong");
										});
							})
				})
	</script> -->
</body>
</html>