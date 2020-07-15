<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="time.TimeDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String screen_date = (String)session.getAttribute("screen_date");
	String title = (String)session.getAttribute("title");
	String theater = (String)session.getAttribute("theater");
	
	String time = request.getParameter("time");
	
	TimeDAO tdao = new TimeDAO();
	List<Integer> rooms = tdao.TimeToScreen(screen_date, title, theater, time);
	

	// 시간 이후의 세션 객체 삭제
	if (session.getAttribute("rooms") != null) {
		session.removeAttribute("rooms");
	}
	if (session.getAttribute("rest") != null) {
		session.removeAttribute("rest");
	}
	if (session.getAttribute("room") != null) {
		session.removeAttribute("room");
	}

	
	session.setAttribute("time", time);
	session.setAttribute("rooms", rooms);

	response.sendRedirect("ReservationMain.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간 받기</title>

</head>
<body>
</body>
</html>