<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
 <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="contact.css">
</head>
<body>
<body>
 <div class="container">
        <div data-aos="fade-up"
     data-aos-duration="3000">

<div class="contact">
    <div class="container">
        <h1>Login</h1>
        <form action="ShowTableServlet " method="post"> <!-- Change method to "post" -->
            <label for="Fullname">FullName:</label>
            <input type="text" id="Fullname" name="name" required><br>
            <label for="number">PhoneNumber:</label>
            <input type="text" id="number" name="number" required><br>
            <button type="submit">Login</button>
        </form>
        <p><a href="index.html">Back to Home</a></p>
        
    </div>
    </div>
 </div>
</div>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
  </script>
    
      
</body>
</body>
</html>