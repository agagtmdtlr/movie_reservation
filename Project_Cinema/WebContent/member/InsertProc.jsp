<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("realPw");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	MemberBean bean = new MemberBean();
	bean.setId(id);
	bean.setName(name);
	bean.setPassword(password);
	bean.setPhone(phone);
	bean.setEmail(email);
	bean.setAddress(address);
	
	
	MemberDAO dao = new MemberDAO();
	int cnt = -1;
	cnt = dao.InsertData(bean);

	if(cnt == -1) {
		out.println("<script>alert('이미 사용된 아이디입니다.');</script>");
		out.println("<script>window.history.go(-1);</script>");
	} else {
		out.println("<script>alert('가입 완료');</script>");
		out.println("<script>location.href='./../common/Main.jsp';</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
</body>
</html>