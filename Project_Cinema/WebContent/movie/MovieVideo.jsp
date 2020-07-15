<%@page import="movie.MovieBean"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
<title>예고편</title>
</head>
<body>
	<%@ include file="./../common/Top.jsp"%>

	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;
		<strong>> 평점 > <%=movie.getTitle()%>
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
					<a href="MovieDetailPage.jsp?movie_no=<%=movie.getMovie_no()%>">주요정보</a>
				</h4>
			</div>
			<div class="col-sm-4">
				<h4><a href="ReviewPage.jsp?movie_no=<%=movie.getMovie_no()%>">평점</a></h4>
			</div>
			<div class="col-sm-4">
				<h4>
					<h4>예고편</h4>
				</h4>
			</div>
			<hr style="border: solid 2px black; margin-top: 0px;">
		</div>

		<div class="col-sm-12">
			<iframe width="900" height="500"
				src="<%=movie.getVideo()%>" frameborder="0"
				allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
	</div>


	<%@ include file="./../common/Bottom.jsp"%></body>
</body>
</html>