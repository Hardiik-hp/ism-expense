<%@page import="com.bean.CategoryReportBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Chart</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>Chart</h2>
	<div style="width: 50rem; height: 50rem;">
		<canvas id="myChart"></canvas>
	</div>
	<script>
		
	<%List<CategoryReportBean> categories = (List<CategoryReportBean>) request.getAttribute("category");%>
		const data = {
			labels :[ 
				
				<%for (CategoryReportBean cr : categories) {%>
					'<%=cr.getCategory()%>',
				<%}%>
		]  ,
			datasets : [ {
				maxBarThickness: 200,
				label : 'Category Wise Investment',
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
				      'rgba(255, 159, 64, 0.2)'				
					],
				borderColor :[ 'rgb(255, 99, 132)',
				      'rgb(255, 159, 64)'],
				data : [ 
					<%for (CategoryReportBean cr : categories) {%>
					<%=cr.getTotalPrice()%>,
				<%}%> ],
				      borderWidth: 1
			} ]
		};
		const config = {
			type : 'bar',
			data : data,
			options : {}
		};
	</script>
	<script>
		const myChart = new Chart(document.getElementById('myChart'), config);
	</script>
</body>
</html>