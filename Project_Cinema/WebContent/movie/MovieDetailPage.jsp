<%@page import="movie.MovieBean"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

	MovieDAO dao = new MovieDAO();
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
<title>영화 상세 보기</title>

</head>
<body>
	<%@ include file="./../common/Top.jsp"%>

	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;
		<strong>> 영화 > <%=movie.getTitle()%>
		</strong>
		<hr>
	</div>

	<div class="container text-center">

		<!-- 검색창 -->
		<div class="col-sm-12">

			<h1 align="left"><%=movie.getTitle()%></h1>
			<hr style="border: solid 2px black; margin-bottom: 0px;">
			<div class="col-sm-4">
				<h4>
					주요정보
				</h4>
			</div>
			<div class="col-sm-4">
				<h4>
					<a href="ReviewPage.jsp?movie_no=<%=movie.getMovie_no()%>">평점</a>
				</h4>
			</div>
			<div class="col-sm-4">
				<h4>
					<h4>
						<a href="MovieVideo.jsp?movie_no=<%=movie.getMovie_no()%>">예고편</a>
					</h4>
				</h4>
			</div>
			<hr style="border: solid 2px black; margin-top: 0px;">
		</div>

		<div class="col-sm-12" align="center">
			<table>
				<tr>
					<td rowspan="7" align="center" style="padding-right: 20px;"><img
						style="width: 200px;" src="./../image/<%=movie.getImage()%>">
					</td>
				</tr>
				<tr>
					<td align="left">출연진 : <%=movie.getActor()%></td>
				</tr>
				<tr>
					<td align="left">감독 : <%=movie.getSupervision()%></td>
				</tr>
				<tr>
					<td align="left">개봉일 : <%=movie.getRelese_date()%></td>
				</tr>
				<tr>
					<td align="left">장르 : <%=movie.getGenre1()%>, <%=movie.getGenre2()%></td>
				</tr>
				<tr>
					<td align="left">상영시간 : <%=movie.getS_time()%>분</td>
				</tr>
				<tr>
					<td align="left"><pre>
							<font style="font-family: sans-serif;">-줄거리- <br><%=movie.getIntro()%></font>
						</pre></td>
				</tr>
			</table>

		</div>

	</div>


	<%@ include file="./../common/Bottom.jsp"%>
</body>
</html>