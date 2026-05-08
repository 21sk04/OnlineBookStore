<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Bookstore</title>
    <style>
        .login-box { width: 300px; margin: 100px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; text-align: center; font-family: sans-serif; }
        input { width: 90%; padding: 10px; margin: 10px 0; }
        button { background-color: #333; color: white; padding: 10px 20px; border: none; cursor: pointer; width: 95%; }
        .error { color: red; font-size: 0.9em; }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="login-box">
        <h2>Login</h2>
        <p class="error">${error}</p>
        <form action="doLogin" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Sign In</button>
        </form>
        <p><a href="home">Back to Home</a></p>
    </div>
</body>
</html>