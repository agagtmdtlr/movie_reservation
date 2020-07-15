<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String contextPath = request.getContextPath();
	
	String myurl = request.getRequestURL().toString();
	String uri = request.getRequestURI();
	int idx = myurl.indexOf(uri);
	
	String uploadPath = "/upload";
	String uploadFolder = myurl.substring(0, idx) + contextPath + uploadPath;
	String realPath = application.getRealPath(uploadPath);
%>

<% 
	MemberBean loginfo = (MemberBean)session.getAttribute("loginfo");
	MemberBean bean = loginfo;
	String mem = ""; //로그인한 사람의 정보
	int whologin = 0; //0 : 미로그인, 1 : 회원 로그인
	
	if (loginfo == null) {
		whologin = 0;
		mem = "미로그인" ;

	} else { //관리자는 아이디가 admin이라고 가정한다.
		mem = loginfo.getName() + "(" + loginfo.getId() + ")님" ;
		if (loginfo.getId().equals("admin")) {
			whologin = 2;
		} else {
			whologin = 1; //일반 사용자 로그인 
		}
	}
	
	session.setAttribute("whologin", whologin);	
%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}


.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
	height: 100px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}
a:link { text-decoration: none;}
a:visited {text-decoration: none;}
a:hover {text-decoration: none; !important}
a:active { text-decoration: none; }
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단</title>
</head>
<body>
	
	<div style="background:lightgray">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="./../common/Main.jsp">Home</a></li>
						<li><a href="./../reservation/ReservationMain.jsp">예매</a></li>
						<li><a href="./../movie/MoviePage.jsp">영화</a></li>
						<li><a href="#">극장</a></li>
						<li><a href="#">이벤트</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${whologin == 0}">
							<li><a href="./../member/LoginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Login</a></li>
							<li><a href="./../member/InserForm.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;Sign Up</a></li>
						</c:if>
						<c:if test="${whologin != 0}">
							<li><a href="#"> <!-- 마이 페이지(예매 확인, 회원정보 확인, 탈퇴 등) -->
								<span class="glyphicon glyphicon-user"></span>&nbsp;
								${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님</a>
							</li>
							<li>
								<a href="./../member/Logout.jsp">
								<span class="glyphicon glyphicon-log-out"></span>&nbsp;
								로그아웃</a>
							</li>
							<li>
								<a href="./../reservation/Confirm.jsp">
								<span class="glyphicon glyphicon-film"></span>&nbsp;예매확인</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	
	<div class="banner">
		<br><br><br><br>
		<h1 align="center"><a href="./../common/Main.jsp" style="color: black;">예매해조</a></h1>
		<br><br>
	</div>

</body>
</html>