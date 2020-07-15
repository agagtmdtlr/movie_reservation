<%@page import="time.TimeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> rooms = null;
	if (session.getAttribute("rooms") == null) {
		rooms = new ArrayList<String[]>();
	} else {
		rooms = (ArrayList<String[]>)session.getAttribute("rooms");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 예약</title>
</head>
<body>
	<div align="center" style="border-right-style: solid; border-right-width: 1px; height: 300px;" >
		<table>
			<tr>
				<th><font style="font-size: 20px;">상영관</font></th>
			</tr>
			<%
				if(rooms.isEmpty()) {
			%> 
			<tr>
				<td>시간을 선택하세요.</td> 
			</tr>
			<%
				} else {
			%> 
			<tr>
				<%
					for(int i=0; i<rooms.size(); i++) {
				%>
					<td>
						<a href="ScreenTo.jsp?room=<%= rooms.get(i) %>">
						<%= rooms.get(i) %>
						</a> 
					</td>
				<% } 
				}%>
			</tr>
		</table>
	</div>
</body>
</html>