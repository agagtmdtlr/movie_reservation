
<%@page import="review.ReviewDAO"%>
<%@page import="review.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	ReviewDAO rdao = new ReviewDAO();
	
	String id = request.getParameter("id");
	double rating = Double.parseDouble(request.getParameter("rating"));
	String content = (String)request.getParameter("content");
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

	ReviewBean rbean = new ReviewBean();
	rbean.setId(id);
	rbean.setMovie_no(movie_no);
	rbean.setRating(rating);
	rbean.setContent(content);
	rdao.InsertReview(rbean); 
	
	response.sendRedirect("MoviePage.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰받기</title>
</head>
<body>
	
</body>
</html>