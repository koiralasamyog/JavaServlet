<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Full-page background */
body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    height: 100vh;           /* Full viewport height */
    display: flex;
    justify-content: center;  /* Center horizontally */
    align-items: center;      /* Center vertically */
    background-color: #f2f2f2;
    overflow: hidden;         /* Prevent scrolling */
}

form {
    border: 3px solid #f1f1f1;
    padding: 20px;
    background-color: white;
    width: 400px;             /* Fixed width */
    box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
    border-radius: 8px;
}

input[type=text], input[type=email], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 4px;
}

button {
    background-color: #04AA6D;
    color: white;
    padding: 14px 20px;
    margin: 12px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    border-radius: 4px;
}

button:hover {
    opacity: 0.8;
}

h2 {
    text-align: center;
}

p {
    text-align: center;
    margin-top: 10px;
}
</style>
</head>
<body>

<form action="register" method="post">
  <h2>Register</h2>

  <label for="fname"><b>First Name</b></label>
  <input type="text" placeholder="Enter First Name" name="fname" required>

  <label for="lname"><b>Last Name</b></label>
  <input type="text" placeholder="Enter Last Name" name="lname" required>

  <label for="email"><b>Email</b></label>
  <input type="email" placeholder="Enter Email" name="email" required>

  <label for="password"><b>Password</b></label>
  <input type="password" placeholder="Enter Password" name="password" required>

  <button type="submit">Register</button>

  <p>Already registered? <a href="index.jsp">Login Here</a></p>
</form>

</body>
</html>

