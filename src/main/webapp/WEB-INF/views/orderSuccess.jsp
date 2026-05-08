<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Success - NovellaBooks</title>
    <style>
        .success-box { 
            text-align: center; margin-top: 100px; font-family: sans-serif; 
        }
        .checkmark { color: #27ae60; font-size: 5rem; }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="success-box">
        <div class="checkmark">✔</div>
        <h1>Thank you, ${customerName}!</h1>
        <p>Your order for ${itemCount} book(s) has been placed successfully.</p>
        <p>A confirmation email has been sent to ${email}.</p>
        <br>
        <a href="home" style="color: #3498db;">Return to Home</a>
    </div>
</body>
</html>