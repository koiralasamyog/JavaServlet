<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Full-page background */
body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    height: 100vh;          /* Full viewport height */
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center;     /* Center vertically */
    background-color: #f2f2f2;
    overflow: hidden;        /* Prevent scrolling */
}

form {
    border: 3px solid #f1f1f1;
    padding: 20px;
    background-color: white;
    width: 350px;             /* Fixed width */
    box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
    border-radius: 8px;
}

input[type=email], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #04AA6D;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    border-radius: 4px;
}

button:hover {
    opacity: 0.8;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

p {
    text-align: center;
    margin-top: 10px;
}
</style>
</head>
<body>

<form action="login" method="post">
  <div class="imgcontainer">
    <img src="images/img_avatar2.png" alt="Avatar" class="avatar">
  </div>

  <label for="email"><b>Email</b></label>
  <input type="email" placeholder="Enter Email" name="email" required>

  <label for="password"><b>Password</b></label>
  <input type="password" placeholder="Enter Password" name="password" required>
        
  <button type="submit">Login</button>
    
  <p>Not registered? <a href="register.jsp">Register Here</a></p>
</form>

</body>
</html>

