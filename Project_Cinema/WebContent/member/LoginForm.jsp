<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#login-input {
	width: 500px;
	height: 40px;
	margin-bottom: 10px;
	vertical-align: middle;
	align-content: center;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@ include file="./../common/Top.jsp"%>
	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true">&nbsp;&nbsp;</span>
		<strong>회원 서비스 > 로그인</strong>
		<hr>
	</div>
	<div class="container text-center" style="display: block">
		<hr>
		<h3>로그인</h3><br><br>
		<div align="center">
			<form action="LoginProc.jsp" method="post">
				<table>
					<tr>
						<td><input id="login-input" type="text" name="id"
							placeholder="아이디를 입력해주세요"></td>
					</tr>
					<tr>
						<td><input id="login-input" type="password" name="password"
							placeholder="비밀번호를 입력해주세요"></td>
					</tr>
					<tr>
						<td><input id="login-input" type="submit" value="로그인"></td>
					</tr>
				</table>
			</form>
		</div>

		<hr>
	</div>

	<%@ include file="./../common/Bottom.jsp"%>
</body>
</html>