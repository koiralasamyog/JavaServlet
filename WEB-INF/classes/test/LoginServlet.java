package test;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    private String jdbcURL = "jdbc:mysql://localhost:3306/testappdb";
    private String jdbcUsername = "webuser";
    private String jdbcPassword = "yourpassword"; 

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {
			  String email = request.getParameter("email");
	String password = request.getParameter("password");

	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

   		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    		PreparedStatement stmt = conn.prepareStatement(sql);
    		stmt.setString(1, email);
    		stmt.setString(2, password);
    		ResultSet rs = stmt.executeQuery();

    		if(rs.next()) {
        		HttpSession session = request.getSession();
        		session.setAttribute("userEmail", email);
        		session.setAttribute("firstName", rs.getString("fname"));
        		response.sendRedirect("home.jsp");
    		} else {
        		response.sendRedirect("index.jsp?error=1");
    		}

    		conn.close();
	} catch (SQLException | ClassNotFoundException e) {
    		throw new ServletException(e);
	}

    }
}
