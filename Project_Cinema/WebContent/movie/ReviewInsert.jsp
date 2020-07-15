<%@page import="review.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="review.ReviewDAO"%>
<%@page import="movie.MovieBean"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginfo") == null) {
		response.sendRedirect("./../member/LoginForm.jsp");
	} else{
	
%>
<%
	request.setCharacterEncoding("UTF-8");
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

	MovieDAO dao = new MovieDAO();
	ReviewDAO rdao = new ReviewDAO();
	
	//아이디 가져오기
	MemberBean loginTop = (MemberBean)session.getAttribute("loginfo");
	String id = loginTop.getId();
	
	MovieBean movie = dao.SelectByPk(movie_no);

%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a:link {
	color: lightgray;
	text-decoration: none;
}

a:visited {
	color: lightgray;
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
<meta charset="UTF-8">
<title>리뷰</title>
</head>
<body>
	<%@ include file="./../common/Top.jsp"%>

	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;
		<strong>> 평점 > <%=movie.getTitle()%> > 리뷰쓰기
		</strong>
		<hr>
	</div>

	<div class="container text-center">

		<!-- 검색창 -->
		<div class="col-sm-12">

			<h1 align="left"><%=movie.getTitle()%></h1>
			<hr style="border: solid 2px black; margin-bottom: 0px;">
			<div class="col-sm-12">
				<h4>리뷰쓰기</h4>
			</div>
			<hr style="border: solid 2px black; margin-top: 0px;">
		</div>

		<div class="col-sm-12" align="center">
			<form action="ReviewInsertProc.jsp" method="post">
				<table width="650" border="1px" align="center">
					<tr>
						<td align="center" width="100px;"><b>작성자</b></td>
						<td><input type="hidden" name="id" value="<%=id %>"><%=id %></td>
					</tr>
					<tr>
						<td align="center" width="100px;"><b>영화명</b></td>
						<td>
							<input type="hidden" name="movie_no" value="<%=movie.getMovie_no() %>"><%=movie.getTitle() %>
						</td>
					</tr>
					<tr align="center">
						<td align="center" width="100px;"><b>평점</b></td>
						<td><input type="text" name="rating" style="width: 30px;"/> / 5.0</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" cols="80" rows="10"></textarea></td>
					</tr>
					<tr align="center" valign="middle">
						<td colspan="5">
						<input type="submit" value="등록">&nbsp;
						<input type="reset" value="취소"></td>
					</tr>
				</table>
			</form>
		</div>


	</div>


	<%@ include file="./../common/Bottom.jsp"%></body>
	<% } %>
</html>