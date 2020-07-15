<%@page import="time.TimeDAO"%>
<%@page import="time.TimeBean"%>
<%@page import="java.util.List"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	
	//아이디 가져오기
	MemberBean loginTop = (MemberBean)session.getAttribute("loginfo");
	String id = loginTop.getId();
	
	ReservationBean rbean = new ReservationBean();
	ReservationDAO rdao = new ReservationDAO();
	
	TimeBean tbean = new TimeBean();
	TimeDAO tdao = new TimeDAO();
	
	List<ReservationBean> rlists = rdao.SelectById(id); // 예매번호, 시간번호, 예매한 좌석 수
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 확인</title>
<script type="text/javascript">
	function Delete(){
		const result = confirm('예매 취소하시겠습니까?');
		
		if(result) {
			document.myForm.submit();
		} else {
			
		}
	}
</script>
</head>
<body>

	<%@ include file="./../common/Top.jsp"%>

	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;
		<strong>> 예매 > 예매 완료 </strong>
		<hr>
	</div>

	<div class="col-sm-12" align="center">
		<h3>나의 예매 내역 조회</h3><br><br>
		<form name="myForm" action="DeleteProc.jsp">
		<% if(rlists.size() == 0) { %>
			예매 내역이 없습니다.
			<br><br><br><br><br><br><br><br><br>
			<hr>
		<% } else { %>
		<% 
			for(int i=0; i<rlists.size(); i++) { 
			int time_no = rlists.get(i).getTime_no(); // 예약 내역에 시간번호 가져오기
			int rno = rlists.get(i).getReservation_no();
			tbean = tdao.SelectByTime_no(time_no); // 영화명, 극장명, 상영관, 시작-끝 시간
		%>
			<table class="table table-bordered" style="width: 800px;">
			
				<thead>
					<tr>
						<th colspan="2"><h3 align="center">
								예매 내역 NO.
								<%=i+1 %></h3></th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<td><b>에매 번호</b></td>
						<td><%=rlists.get(i).getReservation_no()%></td>
					</tr>
					<tr>
						<td><b>아이디</b></td>
						<td><%=id %></td>
					</tr>
					<tr>
						<td><b>영화명</b></td>
						<td><%=tbean.getTitle() %></td>
					</tr>
					<tr>
						<td><b>극장명</b></td>
						<td><%=tbean.getAddress() %></td>
					</tr>
					<tr>
						<td><b>상영관</b></td>
						<td><%=tbean.getRoom() %></td>
					</tr>
					<tr>
						<td><b>상영일</b></td>
						<td><%= tbean.getScreen_date() %></td>
					</tr>
					<tr>
						<td><b>시간</b></td>
						<td><%= tbean.getStart_time() %> ~ <%= tbean.getEnd_time() %></td>
					</tr>
					<tr>
						<td><b>좌석 수</b></td>
						<td><%=rlists.get(i).getCount()%></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="button"
							value="취소하기" style="width: 100px;" onclick="return Delete();">
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="reservation_no" value="<%=rno %>">
			<input type="hidden" name="time_no" value="<%=time_no %>">
			<input type="hidden" name="count" value="<%=rlists.get(i).getCount()%>">
			<br>
			<% } %>
		<% } %>
		</form>
	</div>
	
	<%@ include file="./../common/Bottom.jsp"%>

</body>
</html>