<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>DBP 학생관리</h3>
<hr>
<form name="leesanguk" action="loginCheak.jsp" method="post">
사용자 ID : <input name = "inputId" type="text" size="15" value=""><br>
비밀 번호 : <input name = "inputPw" type="password" size="15" value=""><br>
           <input type="submit" value="로그인">
</form>
<form action="creatUser.jsp" method="POST">
	<input type="submit" value="가입">
</form>
</body>
</html>