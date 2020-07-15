<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="time.TimeDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String screen_date = request.getParameter("screen_date");
	session.setAttribute("screen_date", screen_date);

	TimeDAO tdao = new TimeDAO();
	List<String> titles = tdao.DateToMovie(screen_date);

	// 날짜 이후의 세션 객체 삭제
	if (session.getAttribute("titles") != null) {
		session.removeAttribute("titles");
	}
	if (session.getAttribute("theaters") != null) {
		session.removeAttribute("theaters");
	}
	if (session.getAttribute("times") != null) {
		session.removeAttribute("times");
	}
	if (session.getAttribute("rooms") != null) {
		session.removeAttribute("rooms");
	}
	if (session.getAttribute("rest") != null) {
		session.removeAttribute("rest");
	}
	if (session.getAttribute("title") != null) {
		session.removeAttribute("title");
	}
	if (session.getAttribute("theater") != null) {
		session.removeAttribute("theater");
	}
	if (session.getAttribute("time") != null) {
		session.removeAttribute("time");
	}
	if (session.getAttribute("room") != null) {
		session.removeAttribute("room");
	}

	session.setAttribute("titles", titles);
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