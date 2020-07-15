<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reservation_no = Integer.parseInt(request.getParameter("reservation_no"));
	int time_no = Integer.parseInt(request.getParameter("time_no"));
	int count = Integer.parseInt(request.getParameter("count"));
	
	ReservationDAO rdao = new ReservationDAO();
	rdao.DeleteReservation(reservation_no, time_no, count);
	
	response.sendRedirect("./../reservation/Confirm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 취소</title>
</head>
<body>
	
</body>
</html>