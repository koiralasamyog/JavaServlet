package test;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    private String jdbcURL = "jdbc:mysql://localhost:3306/testappdb";
    private String jdbcUsername = "webuser"; // your DB user
    private String jdbcPassword = "yourpassword"; // your DB password

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        // Get form data
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load JDBC driver and connect
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Insert user into DB
            String sql = "INSERT INTO users (fname, lname, email, password) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fname);
            stmt.setString(2, lname);
            stmt.setString(3, email);
            stmt.setString(4, password); // later we will hash passwords

            int rows = stmt.executeUpdate();
            conn.close();

            // Redirect to login page after success
            if (rows > 0) {
                response.sendRedirect("index.jsp");
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<h2>Registration Failed.</h2>");
            }

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }
}

