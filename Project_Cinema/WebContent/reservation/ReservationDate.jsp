<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Calendar cal = Calendar.getInstance();

	int month = cal.get(Calendar.MONTH)+1; //이번 달
	int day = cal.get(Calendar.DATE); // 오늘 날짜
	int dayOfWeek;// 요일 판정, 일==1, 토==7
%>
<%
	String check = "";
	if((String)request.getAttribute("screen_date") != null) {
		check = (String)request.getAttribute("screen_date");
	} else {
		check = "0";
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간 -> 영화</title>

<style type="text/css">
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:active {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body>
	<div class="col-sm-12" align="center" style="font-size: 15px;">
	 	<table style="width: 800px;">
	 		<tr>
	 		
	 			<%	int n = 1; // 횟수
		 			while(n <= 7){ //일주일
		 				int i=day;
		 				if(i == cal.getActualMaximum(Calendar.DAY_OF_MONTH) + 1) { // 마지막날
		 					cal.add(Calendar.MONTH, 1);
		 					month += 1;
		 					i = 1;
		 					day = 1;
		 					if(month == 13) {
		 						month = 1;
		 						cal.set(Calendar.MONTH, Calendar.JANUARY);
		 					}
		 				}
		 				cal.set(Calendar.DAY_OF_MONTH, i);
		 				dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	 				
		 				if (dayOfWeek == 1) { 
		 		%>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>" onclick="dateClick()" id="c">
									<%=month %>/<%=i %> <font style="color: red;">(일)</font>
								</a>
							</td>
					<%	} else if(dayOfWeek == 2) {  %>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>">
									<%=month %>/<%=i %>(월)
								</a>
							</td>
					<%	} else if(dayOfWeek == 3) {  %>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>"><%=month %>/<%=i %>(화)</a>
							</td>
					<%	} else if(dayOfWeek == 4) {  %>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>"><%=month %>/<%=i %>(수)</a>
							</td>
					<%	} else if(dayOfWeek == 5) {  %>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>"><%=month %>/<%=i %>(목)</a>
							</td>
					<%	} else if(dayOfWeek == 6) {  %>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>"><%=month %>/<%=i %>(금)</a>
							</td>
					<%	} else {  %>
							<td>
								<a href="DateTo.jsp?screen_date=<%=i%>"><%=month %>/<%=i %><font style="color: blue;">(토)</font></a>
							</td>
					<%  } %>
				<%  day += 1; // 일 더하기
					n += 1; // 횟수 1 더하기
					} 
				%>	
	 		</tr>
	 	</table>
	</div>
</body>
</html>