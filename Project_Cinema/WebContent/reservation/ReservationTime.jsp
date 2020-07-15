<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String[]> times = null;
	if (session.getAttribute("times") == null) {
		times = new ArrayList<String[]>();
	} else {
		times = (ArrayList<String[]>)session.getAttribute("times");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간 예약</title>
</head>
<body>
	<div align="center" style="border-right-style: solid; border-right-width: 1px; height: 300px;" >
		<table>
			<tr>
				<th><font style="font-size: 20px;">시간</font></th>
			</tr>
			<%
				if(times.size() == 0) {
			%> 
			<tr>
				<td>극장을 선택하세요.</td> 
			</tr>
			<%
				}
					for(int i=0; i<times.size(); i++) {
			%>
			<tr>
				<td>
					<a href="TimeTo.jsp?time=<%= times.get(i)[0] %>">
						<%=times.get(i)[0]%> ~ <%=times.get(i)[1]%>
					</a>
				</td>
			<tr>
			<% 
					}
			%> 
			<%  %>
		</table>
	</div>
</body>
</html>