<%@page import="java.util.List"%>
<%@page import="review.ReviewDAO"%>
<%@page import="movie.MovieBean"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 검색</title>
</head>
<body>

		<!-- 검색창 -->
		<div class="col-sm-12">
			<form action="MoviePage.jsp" method="post">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
				<br> <br>
			</form>
		</div>
</body>
</html>