<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginCheak</title>
</head>
<body>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String dbURL = "jdbc:mysql://localhost:3306/member?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String dbID = "root";
	String dbPassword = "Ykk159357";

	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	// sql 구사
	// 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
	String user_id = request.getParameter("inputId");
	String user_pw = request.getParameter("inputPw");

	// 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
	String sql = "select * from memberInfo where id= ? and pw= ?;";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, user_id);
	pstmt.setString(2, user_pw);

	rs = pstmt.executeQuery();

	// isLogin 은 로그인 확인 유무를 위한 변수
	Boolean isLogin = false;
	while (rs.next()) {
		// rs.next가 true 라면 = 정보가 있다
		isLogin = true;
	}

	// DB에 내가 적은 정보가 있다면
	if (isLogin) {
		// 지금 로그인할 id와 pw를 session에 저장하고
		session.setAttribute("id", user_id);
		session.setAttribute("pw", user_pw);
		// 첫 페이지로 돌려보낸다
		response.sendRedirect("member.jsp");
	} else {
		// DB에 내가적은 정보가 없다면 경고창을 띄워준다
		response.sendRedirect("output.jsp");
	}
	%>

</body>
</html>