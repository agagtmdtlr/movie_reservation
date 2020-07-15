<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> theaters = null;
	if (session.getAttribute("theaters") == null) {
		theaters = new ArrayList<String>();
	} else {
		theaters = (ArrayList<String>) session.getAttribute("theaters");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 예약</title>
</head>
<body>
	<div align="center" style="border-right-style: solid; border-right-width: 1px; height: 300px;" >
		<table>
			<tr>
				<th><font style="font-size: 20px;">극장</font></th>
			</tr>
			<%
				if(theaters.isEmpty()) {
			%> 
			<tr>
				<td>영화를 선택하세요.</td> 
			</tr>
			<%
				} else {
			%> 
			<tr>
				<%
					for(int i=0; i<theaters.size(); i++) {
				%>
					<td>
						<a href="TheaterTo.jsp?theater=<%= theaters.get(i) %>">
						<%= theaters.get(i) %>
						</a>
					</td>
				<% } 
				}%>
			</tr>
		</table>
	</div>
</body>
</html>