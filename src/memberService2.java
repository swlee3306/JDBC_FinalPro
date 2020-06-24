import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memberCreate")
public class memberService2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// userdao 객체 선언
	private memberDAO dao = new memberDAO();
	// userdto 객체 선언
	private memberDTO dto = new memberDTO();

	int result = 0;

	public Connection conn;
	public ResultSet rs;
	public Statement stmt;

	public memberService2() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter Writer = response.getWriter();

		// Parameter로 넘어온 값들을 dto에 넣어준다.
		dto.setId(request.getParameter("id").trim());// 빈칸을 신경 쓰지 않기 위해 사용
		dto.setPw(request.getParameter("pw").trim());
		dto.setName(request.getParameter("name").trim());
		dto.setTel(request.getParameter("tel").trim());
		dto.setEmail(request.getParameter("email").trim());
		dto.setDept(request.getParameter("dept").trim());
		dto.setGender(request.getParameter("gender").trim());
		dto.setBirth(request.getParameter("birth").trim());
		dto.setIntroduce(request.getParameter("introduce").trim());

		try {

			String dbURL = "jdbc:mysql://localhost:3306/member?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "Ykk159357";
			Class.forName("org.mariadb.jdbc.Driver");

			try {

				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String SQL = "SELECT * FROM memberInfo;";

		try {

			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				if (rs.getString("id").equals(dto.getId())) {

					Writer.println("<script>");
					Writer.println("alert('Same ID!')");
					Writer.println("</script>");
					
					result = -1;
					
					break;

				} else {
					
					continue;

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (result == -1) {

			System.out.println("가입 실패!");
			
			Writer.println("<script>");
			Writer.println("alert('Fail! already in ID!'); location.href='creatUser.jsp'");
			Writer.println("</script>");
			
			

		} else {

			result = dao.register(dto);

			System.out.println("가입 성공!");

			Writer.println("<script>");
			Writer.println("alert('Create!'); location.href='login.jsp';");
			Writer.println("</script>");

		

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
