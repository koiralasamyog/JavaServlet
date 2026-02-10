<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Global styles */
body {
    font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    background-color: #f2f2f2;
    color: #333;
}

/* Container for all content */
.container {
    max-width: 900px;
    margin: 40px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
}

/* Header section */
header {
    text-align: center;
    margin-bottom: 30px;
}

header h1 {
    color: #04AA6D;
    margin-bottom: 5px;
}

header p {
    font-size: 18px;
    color: #555;
}

/* Sections */
section {
    margin-bottom: 30px;
}

section h2 {
    border-bottom: 2px solid #04AA6D;
    padding-bottom: 5px;
    color: #04AA6D;
}

/* Project cards */
.project-cards {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.project-card {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 6px;
    flex: 1 1 calc(45% - 20px);
    box-shadow: 0 0 5px rgba(0,0,0,0.1);
}

/* Contact */
.contact p {
    margin: 8px 0;
}

/* Logout button */
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

.logout-btn:hover {
    opacity: 0.8;
}

/* Responsive for small screens */
@media screen and (max-width: 600px) {
    .projects {
        flex-direction: column;
    }
}
</style>
</head>
<body>

<div class="container">
    <header>
        <h1>Welcome, <%= session.getAttribute("firstName") != null ? session.getAttribute("firstName") : "User" %>!</h1>
        <p>This is your portfolio home page</p>
    </header>

    <section class="about">
        <h2>About Me</h2>
        <p>Email: <%= session.getAttribute("userEmail") != null ? session.getAttribute("userEmail") : "Not Provided" %></p>
        <p>Here you can put a short bio or description about yourself.</p>
    </section>

    <section class="projects">
        <h2>Projects</h2>
        <div class="project-cards">
        	<div class="project-card">
            		<h3>Project 1</h3>
            		<p>Description of Project 1</p>
       		</div>
        	<div class="project-card">
            		<h3>Project 2</h3>
            		<p>Description of Project 2</p>
        	</div>
	</div>
        <!-- Add more projects as needed -->
    </section>

    <section class="contact">
        <h2>Contact</h2>
        <p>Phone: 123-456-7890</p>
        <p>Email: <%= session.getAttribute("userEmail") != null ? session.getAttribute("userEmail") : "Not Provided" %></p>
    </section>

    <form action="index.jsp" method="get">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

</body>
</html>

