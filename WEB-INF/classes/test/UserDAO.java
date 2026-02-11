package test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/testappdb";
    private String jdbcUsername = "webuser";
    private String jdbcPassword = "yourpassword";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // ✅ READ (SELECT)
    public List<User> getAllUsers() {
	System.out.println("Fetching users from DB...");

        List<User> users = new ArrayList<>();

        try(Connection conn = getConnection()) {

            String sql = "SELECT id, fname, lname, email FROM users";
            PreparedStatement stmt = conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {

                users.add(new User(
                        rs.getInt("id"),
                        rs.getString("fname"),
                        rs.getString("lname"),
                        rs.getString("email")
                ));
            }
	    System.out.println("User found: " + rs.getString("email"));


        } catch(Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    // ✅ CREATE (INSERT)
    public void addUser(String firstName, String lastName, String email, String password) {

        try(Connection conn = getConnection()) {

            String sql = "INSERT INTO users(fname,lname,email,password) VALUES (?,?,?,?)";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, password);

            stmt.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    // ✅ UPDATE
    public void updateUser(int id, String firstName, String lastName, String email) {

        try(Connection conn = getConnection()) {

            String sql = "UPDATE users SET fname=?, lname=?, email=? WHERE id=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setInt(4, id);

            stmt.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    // ✅ DELETE
    public void deleteUser(int id) {

        try(Connection conn = getConnection()) {

            String sql = "DELETE FROM users WHERE id=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            stmt.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}

