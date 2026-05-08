<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - NovellaBooks</title>
    <style>
        .checkout-container { padding: 40px 15%; font-family: 'Segoe UI', sans-serif; display: flex; gap: 40px; }
        .form-section { flex: 2; }
        .summary-section { flex: 1; background: #f9f9f9; padding: 20px; border-radius: 8px; height: fit-content; }
        input[type="text"], input[type="email"] { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 4px; }
        .place-order-btn { background: #27ae60; color: white; width: 100%; padding: 15px; border: none; border-radius: 5px; cursor: pointer; font-size: 1.1rem; }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="checkout-container">
        <div class="form-section">
            <h2>Shipping Information</h2>
            <form action="placeOrder" method="POST">
                <label>Full Name</label>
                <input type="text" name="customerName" required placeholder="John Doe">
                
                <label>Email Address</label>
                <input type="email" name="customerEmail" required placeholder="john@example.com">
                
                <label>Shipping Address</label>
                <input type="text" name="address" required placeholder="123 Street Name, City">
                
                <button type="submit" class="place-order-btn">Place Order</button>
            </form>
        </div>

        <div class="summary-section">
            <h3>Order Summary</h3>
            <p>Items in cart: <strong>${cartCount}</strong></p>
            <hr>
            <c:forEach var="item" items="${cartItems}">
                <p style="text-transform: capitalize;">• ${item}</p>
            </c:forEach>
            <hr>
            <h3>Total Paid: $${totalPrice}</h3>
        </div>
    </div>
</body>
</html>