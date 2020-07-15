<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="movie.MovieBean"%>
<jsp:useBean id="mdao" class="movie.MovieDAO"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<%@ include file="./../common/Top.jsp"%>
	
	<div style="margin: 10px;">
		<hr>
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;
			<strong>> 홈</strong>
		<hr>
	</div>
	
	<div class="container text-center">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<!-- 점 표시 -->
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->

			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<a href="./../movie/MovieDetailPage.jsp?movie_no=4">
						<img src="./../image/banner1.jpg">
					</a>
				</div>

				<div class="item">
					<a href="./../movie/MovieDetailPage.jsp?movie_no=9">
						<img src="./../image/banner2.jpg">
					</a>
				</div>

				<div class="item">
					<a href="./../movie/MovieDetailPage.jsp?movie_no=5">
						<img src="./../image/banner3.jpg">
					</a>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<div>
			<br><br>
			<div class="col-sm-4" >
				<img style="width: 100%" src="./../image/main1.png">
			</div>
			<div class="col-sm-4" >
				<img style="width: 100%" src="./../image/main2.jpg">
			</div>
			<div class="col-sm-4" >
				<img style="width: 100%" src="./../image/main3.jpg">
			</div>
			<br><br><br><br><br><br>
		</div>
	</div>

	<%@ include file="./../common/Bottom.jsp"%>
</body>
</html>