<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginfo") == null) {
		response.sendRedirect("./../member/LoginForm.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 하기</title>
</head>
<body>
	<%@ include file="./../common/Top.jsp"%>

	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;
		<strong>> 예매 </strong>
		<hr>
	</div>
		
	
	<%@ include file="ReservationMiddle.jsp"%>
	
	<%@ include file="./../common/Bottom.jsp"%>
</body>
</html>