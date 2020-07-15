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
	String time = (String)session.getAttribute("time");
	String room = request.getParameter("room");
	

	// 시간 이후의 세션 객체 삭제
	if (session.getAttribute("rest") != null) {
		session.removeAttribute("rest");
	}
	
	session.setAttribute("room", room);
	
	//잔여 좌석 전송
	TimeDAO tdao = new TimeDAO();
	int room_no = Integer.parseInt(room);
	
	int rest = tdao.GetSeat_state(screen_date, title, theater, time, room_no);
	session.setAttribute("rest", rest);

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