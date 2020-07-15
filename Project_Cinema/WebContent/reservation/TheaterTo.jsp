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
	String theater = request.getParameter("theater");
	session.setAttribute("theater", theater);
	
	TimeDAO tdao = new TimeDAO();
	List<String[]> times = tdao.TheaterToTime(screen_date, title, theater);
	

	// 극장 이후의 세션 객체 삭제
	if (session.getAttribute("times") != null) {
		session.removeAttribute("times");
	}
	if (session.getAttribute("rooms") != null) {
		session.removeAttribute("rooms");
	}
	if (session.getAttribute("rest") != null) {
		session.removeAttribute("rest");
	}

	if (session.getAttribute("time") != null) {
		session.removeAttribute("time");
	}
	if (session.getAttribute("room") != null) {
		session.removeAttribute("room");
	}

	
	
	session.setAttribute("times", times);
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