<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#insert-input {
	width: 300px;
	height: 30px;
	margin-bottom: 10px;
	vertical-align: middle;
	align-content: center;
}
#tempPw {
	width: 300px;
	height: 30px;
	margin-bottom: 10px;
	vertical-align: middle;
	align-content: center;
}
#realPw {
	width: 300px;
	height: 30px;
	margin-bottom: 10px;
	vertical-align: middle;
	align-content: center;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function passwdCheck() {
		var temp = document.getElementById('tempPw').value;
		var real = document.getElementById('realPw').value;
		var result = document.getElementById('result');
		
		if(temp != '' && real != '') {
			if(temp == real) {
				result.innerHTML = '비밀번호가 일치합니다.'
				result.style.color = 'blue';				
			} else {
				result.innerHTML = '비밀번호가 일치하지 않습니다.'
				result.style.color = 'red';
			}
		}
	}
	
</script>
</head>
<body>
	<%@ include file="./../common/Top.jsp"%>
	<div style="margin: 10px;">
		<hr>
		<span class="glyphicon glyphicon-home" aria-hidden="true">&nbsp;&nbsp;</span>
		<strong>회원 서비스 > 회원 가입</strong>
		<hr>
	</div>
	<div class="container text-center" style="display: block">
		<div class="col-sm-12">
			<hr>
			<h3>회원가입</h3><br><br>
			<div align="center">
				<form action="./../member/InsertProc.jsp" method="post" name="insertForm">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="insert-input" name="id"></td>
						</tr>
						<tr>	
							<td>비밀번호</td>
							<td><input type="password" id="tempPw" name="tempPw" 
								placeholder="비밀번호를 입력해주세요"  onchange="passwdCheck()"></td>
						</tr>
						<tr>	
							<td>비밀번호 확인</td>
							<td><input type="password" id="realPw" name="realPw" 
								placeholder="비밀번호를 똑같이 입력해주세요" onchange="passwdCheck()"></td>
						</tr>
						<tr>	
							<td>결과</td>
							<td><span id="result"></span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" id="insert-input" name="name"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" id="insert-input" name="phone"></td>
						</tr>
						<tr>
							<td>email</td>
							<td><input type="text" id="insert-input" name="email"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" id="insert-input" name="address"></td>
						</tr>
						<tr style="padding-top: 20px;">
							<td align="center"><input type="reset" value="취소" style="width: 150px; height: 30px;"></td>
							<td align="center"><input type="submit" value="가입" style="width: 150px; height: 30px;"></td>
						</tr>
					</table>
				</form>
			</div>
	
			<hr>
			
		</div>
	</div>

	<%@ include file="./../common/Bottom.jsp"%>
</body>
</html>