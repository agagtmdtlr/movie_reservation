<%@page import="movie.MovieBean"%>
<%@page import="java.util.List"%>
<%@page import="review.ReviewDAO"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MovieDAO dao = new MovieDAO();
	ReviewDAO rdao = new ReviewDAO();
	List<MovieBean> lists;

	if (request.getParameter("search") != null) {
		String search = request.getParameter("search");
		lists = dao.SelectByTitle(search);
	} else if (request.getParameter("check") != null) {
		String[] check = request.getParameterValues("check");
		lists = dao.SelectByGenre(check);
	} else {
		lists = dao.SelectAll();
	}
	double rating = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
</head>
<body>


	<div class="col-sm-12">
		<%
			if (lists.size() == 0) {
		%>
		<h4>찾으시는 데이터가 존재하지 않습니다.</h4>
		<%
			} else {
				for (MovieBean movie : lists) {
					rating = rdao.GetAvgRating(movie.getMovie_no());
		%>
		<div class="col-sm-4">
			<table>
				<tr>
					<td colspan="2" style="padding-bottom: 10px;"><img
						style="width: 200px;" src="./../image/<%=movie.getImage()%>">
					</td>
				</tr>
				<tr>
					<td>★ <%=rating%></td>
					<td><a
						href="MovieDetailPage.jsp?movie_no=<%=movie.getMovie_no()%>"><%=movie.getTitle()%></a></td>
				</tr>
			</table>
			<br>
		</div>
		<%
			}
		%>
		<%
			}
		%>
	</div>
</body>
</html>