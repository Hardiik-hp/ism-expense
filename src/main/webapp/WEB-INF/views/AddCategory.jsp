<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<f:form action="saveCategory" method="post" modelAttribute="category">
		Add Category <f:input path="category" />
		<input type="submit" value="Add">
	</f:form>
</body>
</html>