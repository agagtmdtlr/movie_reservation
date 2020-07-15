<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="time.TimeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> titles = null;
	if(session.getAttribute("titles") == null) {
		titles = new ArrayList<String>();
	} else {
		titles = (ArrayList<String>)session.getAttribute("titles");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예약</title>
<style>
.tr {
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<div align="center" style="border-right-style: solid; border-right-width: 1px; 
								border-left-style: solid; border-left-width: 1px; height: 300px;" >
		<table>
			<tr>
				<th><font style="font-size: 20px;">영화</font></th>
			</tr>
			<%
				if(titles.size()==0) {
			%> 
			<tr>
				<td>날짜를 선택하세요.</td> 
			</tr>
			<%
				} else {
			%>
			<%
				for(int i=0; i<titles.size(); i++) {
			%>
			<tr>
				<td>
					<a href="MovieTo.jsp?title=<%= titles.get(i) %>">
						<%= titles.get(i) %>
					</a>
				</td>
			<% } 
			}%>
				</tr>
		</table>
	</div>
</body>
</html>