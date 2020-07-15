<%@page import="java.util.List"%>
<%@page import="movie.MovieBean"%>
<%@page import="review.ReviewDAO"%>
<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장르별 검색</title>
</head>
<body>

	<!-- 장르 별 검색 -->
	<div class="col-sm-12">
		<form action="MoviePage.jsp" method="post" name="genreForm">
			<label class="checkbox-inline"> <input type="checkbox"
				name="check" value="액션">액션
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="코믹">코믹
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="드라마">드라마
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="범죄">범죄
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="미스터리">미스터리
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="정치">정치
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="애니메이션">애니메이션
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="SF">SF
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name="check" value="로맨스">로맨스
			</label> <label class="checkbox-inline"> <input type="submit"
				value="검색">
			</label>
		</form>
		<br>
	</div>

</body>
</html>