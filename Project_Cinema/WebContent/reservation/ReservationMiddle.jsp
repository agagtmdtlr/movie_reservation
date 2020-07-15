<%@page import="time.TimeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rest;
	if (session.getAttribute("rest") != null) {
		rest = (Integer)session.getAttribute("rest");
	} else {
		rest = -1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중간부</title>
<script type="text/javascript">
	function reservationClick(){
		var rest = document.myForm.rest.value;
		var count = document.myForm.count.value;;
		const result = confirm('예매하시겠습니까?');
		if(rest == 0) {
			alert( '예매 가능한 좌석이 없습니다.' ) ;
			return false ;
		} else if(rest < count) {
			alert( '좌석이 부족합니다.' ) ;
			return false ;
		} else {
			if(result) {
				document.myForm.submit();
			} else {
				return false;
			}
		}
		
	}
	
</script>	
</head>
<body>
	<div class="container text-center">
	
		<div class="col-sm-12" style="padding-bottom: 10px;">
			<div>
				<jsp:include page="ReservationDate.jsp" flush="true"/>
			</div>
		</div>
		
		<hr style="border-bottom-style: solid;">
		<div class="col-sm-3">
			<div>
				<jsp:include page="ReservationMovie.jsp" flush="true"/> 
			</div>
		</div>
		
		<div class="col-sm-3">
			<div>
				<jsp:include page="ReservationTheater.jsp" flush="true"/> 
			</div>
		</div>
		
		<div class="col-sm-3">
			<div>
				<jsp:include page="ReservationTime.jsp" flush="true"/>
			</div>
		</div>
		
		<div class="col-sm-3">
			<div>
				<jsp:include page="ReservationScreen.jsp" flush="true"/> 
			</div>
		</div>
		
		<div class="col-sm-12" align="right" style="padding-top: 30px;">
			<form name="myForm" action="Final.jsp">
				<%
					if(rest != -1) {
				%>
					예약 가능한 좌석 수 : <%=rest %> &nbsp;&nbsp;
				<% } else { %>
					
				<% } %>
				<input type="hidden" name="rest" value="<%=rest %>">
				<input type="text" name="count">
				<button type="submit" style="width: 150px; height: 30px;" 
					onclick="return reservationClick();"  name="okBtn"> 
					예매하기
				</button>
			</form>
		</div>
	</div>
</body>
</html>