import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memberUpdate")
public class memberService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// userdao 객체 선언
	private memberDAO dao = new memberDAO();
	// userdto 객체 선언
	private memberDTO dto = new memberDTO();

	int result = 0;

	public Connection conn;
	public ResultSet rs;
	public Statement stmt;

	public memberService() {
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


		if (result == -3) {

			System.out.println("업데이트 실패!");
			Writer.println("<script>");
			Writer.println("alert('Fail!')");
			Writer.println("</script>");

		} else {
			
			result = dao.update(dto);

			System.out.println("업데이트 성공!");

			Writer.println("<script>");
			Writer.println("alert('Update!');");
			Writer.println("</script>");
			
			
			response.sendRedirect("detail.jsp?inputId="+request.getParameter("id"));
			

		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
