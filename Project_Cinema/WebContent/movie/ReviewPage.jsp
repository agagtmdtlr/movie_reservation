<%@page import="review.Paging"%>
<%@page import="review.ReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="review.ReviewDAO"%>
<%@page import="movie.MovieBean"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

	MovieDAO dao = new MovieDAO();
	ReviewDAO rdao = new ReviewDAO();
	
	MovieBean movie = dao.SelectByPk(movie_no);

%>

<%
	String pageNumber = request.getParameter("pageNumber");
	String pageSize = request.getParameter("pageSize");

	int totalCount = rdao.GetCount(movie_no);
	String url = "ReviewPage.jsp?movie_no=" + movie_no;
	
	Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
	
	int beginRow = pageInfo.getBeginRow();
	int endRow = pageInfo.getEndRow();
	List<ReviewBean> lists = rdao.SelectAll(beginRow, endRow, movie_no);
	
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
<title>평점</title>
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
				<h4>평점</h4>
			</div>
			<div class="col-sm-4">
				<h4>
					<h4><a href="MovieVideo.jsp?movie_no=<%=movie.getMovie_no()%>">예고편</a></h4>
				</h4>
			</div>
			<hr style="border: solid 2px black; margin-top: 0px;">
		</div>

		<div class="col-sm-12" align="center">
			<table>
				<tr>
					<td rowspan="3" align="center" style="padding-right: 20px;"><img
						style="width: 200px;" src="./../image/<%=movie.getImage()%>">
					</td>
				</tr>
				<tr>
					<td align="right" style="padding-bottom: 50px;">
						<form action="ReviewInsert.jsp">
							<font style="font-size: 19px;">총 평점 : ★ <%=rdao.GetAvgRating(movie_no)%></font>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" value="<%=movie.getMovie_no()%>" name="movie_no">
							<input type="submit" name="review" value="리뷰쓰기">
						</form>
					</td>
				</tr>
				<tr>
					<td align="left">
						<table class="table" style="width: 450px;">
							<!-- 리뷰테이블 -->
							<tr>
								<td>아이디</td>
								<td>평점</td>
								<td>댓글</td>
							</tr>
							<%
								if (lists.size() == 0) {
							%>	
								<tr>
									<td colspan="5">평점 데이터가 없습니다.<br> 리뷰를 입력해주세요.</td>
								</tr>
							<%
								} else {
									for (ReviewBean review : lists) {%>
									<tr>
										<td><%= review.getId()%></td>
										<td><%= review.getRating() %></td>
										<td><a><%= review.getContent() %></a></td>
									</tr>
							<%		}
									%>
									<tr>
										<td colspan="6" align="center"><br> 
											<%=pageInfo.getPagingHtml()%>
										</td>
									</tr>
									<%
								}
							%>
						</table>
					</td>
				</tr>
			</table>

		</div>


	</div>


	<%@ include file="./../common/Bottom.jsp"%></body>
</html>