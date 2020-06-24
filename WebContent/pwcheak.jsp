<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>본인 여부 확인</h3>
<hr>
<form action="loginCheak2.jsp"method="post">
사용자 ID : <input name = "inputId" type="text" value="<%= request.getParameter("inputId")%>" ><br>
비밀 번호 : <input name = "inputPw" type="password" value="" ><br>
          <input type="submit" value="수정">           
</form>
</body>
</html>