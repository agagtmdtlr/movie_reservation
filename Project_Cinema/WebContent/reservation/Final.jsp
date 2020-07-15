<%@page import="reservation.Re_StatementBean"%>
<%@page import="time.TimeDAO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationBean"%>
<%@ include file="./../common/Top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 

	ReservationBean rbean = new ReservationBean();
	ReservationDAO rdao = new ReservationDAO();
	Re_StatementBean rebean = new Re_StatementBean();
	TimeDAO tdao = new TimeDAO();
	
	String screen_date = (String)session.getAttribute("screen_date");
	String title = (String)session.getAttribute("title");
	String theater = (String)session.getAttribute("theater");
	String time = (String)session.getAttribute("time");
	String room = (String)session.getAttribute("room");
	int room_no = Integer.parseInt(room);
	
	// 표 수 가져오기
	int count = Integer.parseInt(request.getParameter("count"));
	
	// 시간 번호 가져오기
	int time_no = tdao.GetTime_no(screen_date, title, theater, time, room_no);
	
	// 회원 아이디 가져오기
	MemberBean loginTop = (MemberBean)session.getAttribute("loginfo");
	String id = loginTop.getId();
	
	// 예약 테이블에 삽입하기	
	rbean.setId(id);
	rbean.setTime_no(time_no);
	rbean.setCount(count);
	
	rebean.setSeat_state(count);
	rebean.setTime_no(time_no);
	rdao.InsertReservation(rbean, rebean);
	
	//마무리 세션 삭제
	session.removeAttribute("titles");
	session.removeAttribute("theaters");
	session.removeAttribute("times");
	session.removeAttribute("rooms");
	
	session.removeAttribute("screen_date");
	session.removeAttribute("title");
	session.removeAttribute("theater");
	session.removeAttribute("time");
	session.removeAttribute("room");
	session.removeAttribute("rest");
	
	response.sendRedirect("./../reservation/Confirm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 마지막 단계</title>
</head>
<body>

</body>
</html>