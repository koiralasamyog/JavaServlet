<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="test.User" %>
<%
    List<User> users = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    background-color: #f2f2f2;
    color: #333;
}

.container {
    max-width: 1000px;
    margin: 40px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
}

header {
    text-align: center;
    margin-bottom: 30px;
}

header h1 {
    color: #04AA6D;
}

header p {
    font-size: 18px;
    color: #555;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #ccc;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #04AA6D;
    color: white;
}

.action-btn {
    padding: 5px 10px;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
}

.add-btn {
    background-color: #04AA6D;
}

.edit-btn {
    background-color: #2196F3;
}

.delete-btn {
    background-color: #f44336;
}

.logout-btn {
    display: block;
    width: 150px;
    margin: 20px auto 0 auto;
    padding: 12px 20px;
    background-color: #f44336;
    color: white;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    text-align: center;
    font-size: 16px;
    cursor: pointer;
}

.logout-btn:hover,
.action-btn:hover {
    opacity: 0.8;
}
</style>
</head>
<body>

<div class="container">
    <header>
        <h1>Welcome, <%= session.getAttribute("firstName") != null ? session.getAttribute("firstName") : "User" %>!</h1>
        <p>Your Portfolio Home with CRUD Users</p>
    </header>

    <h2>Users</h2>
    <a href="UserServlet?action=add" class="action-btn add-btn">Add New User</a>
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <%
            if(users != null){
                for(User u : users){
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getFirstName() %></td>
            <td><%= u.getLastName() %></td>
            <td><%= u.getEmail() %></td>
            <td>
                <a href="UserServlet?action=edit&id=<%=u.getId()%>" class="action-btn edit-btn">Edit</a>
                <a href="UserServlet?action=delete&id=<%=u.getId()%>" class="action-btn delete-btn">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <form action="index.jsp" method="get">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

</body>
</html>

