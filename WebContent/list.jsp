<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

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
	<!-- --------------------------- <body> --------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">
			<main class="main">
				<h2 class="main title">DBP 학생 목록</h2>

				<div class="notice margin-top">

					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>ID</th>
								<th>&nbsp;이름</th>
							</tr>
						</thead>
						<tbody>
							<%
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							
							String Dept = "defult";
							String sql = "select * from memberInfo;"; 

							String dbURL = "jdbc:mysql://localhost:3306/member?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
							String dbID = "root";
							String dbPassword = "Ykk159357";

							Class.forName("org.mariadb.jdbc.Driver");
							conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
							
							Dept = (request.getParameter("Dept") == null) ? "" : request.getParameter("Dept");
							
							switch(Dept){
							
								case "Computer" : sql = "select * from memberInfo where dept = 'Computer';";
									break;
								case "Information" : sql = "select * from memberInfo where dept = 'Information';";
									break;
								case "Itcontents" : sql = "select * from memberInfo where dept = 'Itcontents';";	
									break;
								case "Korean" : sql = "select * from memberInfo where dept = 'Korean';";	
									break;
								case "default" : sql = "select * from memberInfo;";	
									break;	
							}
							
							
							pstmt = conn.prepareStatement(sql);
							
							rs = pstmt.executeQuery();

							while (rs.next()) {
								%>

								<tr>
									<td><%=rs.getInt("no")%></td>
									<td><a href="detail.jsp?inputId=<%=rs.getString("id")%>"><%=rs.getString("id")%></a></td>
									<td>&nbsp;&nbsp; <%=rs.getString("name")%></td>
								</tr>
							
								<%
							}
							%>
						</tbody>
					</table>
				</div>
				
						
				<div class="search-form margin-top first align-right">
					<br>
					<form action="list.jsp" method=get>
						<fieldset>
							<legend class="hidden">학생 분류</legend>
							<label class="hidden">학과</label> 
							<select name="Dept" >
								<option value="default">전체</option>
								<option value="Computer">컴퓨터공학부</option>
								<option value="Information">정보통신학부</option>
								<option value="Itcontents">IT콘텐츠학과</option>
								<option value="Korean">국어국문학과</option>
							</select> <input type="submit" value="검색" />
						</fieldset>
					</form>
				</div>
			</main>


		</div>
	</div>

</body>

</html>