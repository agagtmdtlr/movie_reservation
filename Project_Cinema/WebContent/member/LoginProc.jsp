<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='./../common/Top.jsp'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProc</title>
<script type="text/javascript">
	function loginCheckFalse(){
		alert('아이디와 비밀번호를 확인해주세요.');
	}
</script>
</head>
<body>
<%
	MemberDAO dao = new MemberDAO();

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	MemberBean member = dao.LoginCheck(id, password);
	
	if(member == null) {
		out.println("<script>alert('로그인 실패!!');</script>");
		out.println("<script>location.href='LoginForm.jsp';</script>");
	} else {
		session.setAttribute("loginfo", member);
		response.sendRedirect("./../common/Main.jsp");
	}
%>
</body>
</html>