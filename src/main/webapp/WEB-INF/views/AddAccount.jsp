<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Account</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<h2>Add Account</h2>
	<f:form action="saveaccount" method="post" modelAttribute="accounts">
	Account type : <f:select path="accountType" id="type">
			<option disabled="disabled" selected="selected">--Select Payment Type--</option>
			<f:option value="Paytm" >Paytm</f:option>
			<f:option value="CreditCard">Credit Card</f:option>
			<f:option value="DebitCard">Debit Card</f:option>
			<f:option value="Cash">Cash</f:option>
		</f:select> 
		<br><br>
		<div id="cardno">
	Card Number : <f:input path="cardNumber" />
	<br><br>
		</div>
		 <div id="upiid">
	UPI ID : <f:input path="upiId" />
	<br><br>
		</div>
		<div id="amount" >
	Account Balance : <f:input path="balance" />
		<br><br>
		</div>
		<input type="submit" Value="Add">
	</f:form>
	
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded',function(){
        document.querySelector("#type").onchange=function(){
        	
        	if(this.value == 'CreditCard' || this.value == 'DebitCard' ){
                document.querySelector("#upiid").style.display='none';
                document.querySelector("#cardno").style.display='block';
                document.querySelector("#amount").style.display='block';
        	}
        	if(this.value == "Cash"){
        		document.querySelector("#upiid").style.display='none';
                document.querySelector("#cardno").style.display='none';
                document.querySelector("#amount").style.display='block';
        	}
        	if(this.value == "Paytm"){
        		document.querySelector("#upiid").style.display='block';
                document.querySelector("#cardno").style.display='none';
                document.querySelector("#amount").style.display='block';
        	}
		}
	})
	</script>


</body>
</html>