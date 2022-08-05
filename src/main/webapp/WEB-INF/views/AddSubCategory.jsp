<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Sub Category</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>Sub Category</h2> <br> <br>
	<f:form action="savesubcategory" method="post"
		modelAttribute="subcategory">
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
			Sub Category
			<f:input path="subCategoryName" />
		</div>
		<input type="submit" value="add">
	</f:form>
	
	
	
</body>
</html>