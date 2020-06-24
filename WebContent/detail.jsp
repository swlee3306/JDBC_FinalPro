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
<style>
#visual .content-container {
	height: inherit;
	display: flex;
	align-items: center;
}
</style>
</head>

<body>
	<div id="body">
		<div class="content-container clearfix">
			<main class="main">
				<h2 class="main title">DBP 학생 정보</h2>
				<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				String dbURL = "jdbc:mysql://localhost:3306/member?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
				String dbID = "root";
				String dbPassword = "Ykk159357";

				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

				
				String user_id = request.getParameter("inputId");

			
				String sql = "select * from memberInfo where id = ?;";
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, user_id);

				rs = pstmt.executeQuery();

			
				Boolean isLogin = false;
				while (rs.next()) {
					
					isLogin = true;
				}

				// DB에 내가 적은 정보가 있다면
				if (isLogin) {
					String sql2 = "select * from memberInfo where id = ?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, user_id);
			        rs = pstmt.executeQuery();
			        while(rs.next()){
					%>
					<div class="notice margin-top">
					  <h2>ID : <%= rs.getString("id") %></h2><br>
					  <h2> NAME : <%= rs.getString("name") %></h2><br>
					  <h2> TEL : <%= rs.getString("tel") %></h2><br>
					  <h2> EMAIL : <%= rs.getString("email") %></h2><br>
					  <h2> DEPT : <%= rs.getString("dept") %></h2><br>
					  <h2> GENDER : <%= rs.getString("gender") %></h2><br>
					  <h2> BIRTH : <%= rs.getString("birth") %></h2><br>
					  <h2> INTRO : <%= rs.getString("introduce") %></h2><br>
				   	</div>
					<%
			        }
				} else {
					// DB에 내가적은 정보가 없다면 경고창을 띄워준다
					response.sendRedirect("output.jsp");
				}
				%>
				<div class="search-form margin-top first align-right">
					
				<form action="list.jsp" method=post>
					<input type="submit" value="목록"/>
				</form>
				<form action="pwcheak.jsp?inputId=<%=user_id%>" method=post>
					<input type="submit" value="수정"/>
				</form>
				</div>
			</main>
		</div>
	</div>

</body>

</html>