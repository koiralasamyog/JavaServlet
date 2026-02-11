<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body { font-family: Arial, Helvetica, sans-serif; background-color: #f2f2f2; }
.container {
    width: 400px;
    margin: 50px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
}
input[type=text], input[type=email], input[type=password] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button {
    width: 100%;
    padding: 12px;
    background-color: #04AA6D;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
button:hover { opacity: 0.8; }
h2 { text-align: center; color: #04AA6D; }
</style>
</head>
<body>

<div class="container">
    <h2>Add New User</h2>
    <form action="UserServlet" method="post">
        <input type="hidden" name="action" value="insert">
        <label>First Name</label>
        <input type="text" name="firstName" required>
        <label>Last Name</label>
        <input type="text" name="lastName" required>
        <label>Email</label>
        <input type="email" name="email" required>
        <label>Password</label>
        <input type="password" name="password" required>
        <button type="submit">Add User</button>
    </form>
</div>

</body>
</html>

