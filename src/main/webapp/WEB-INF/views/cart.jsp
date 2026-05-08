<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        .cart-container { padding: 40px 10%; font-family: 'Segoe UI', sans-serif; }
        .cart-item { 
            display: flex; justify-content: space-between; 
            padding: 20px; border-bottom: 1px solid #eee; align-items: center;
        }
        .item-info { flex: 2; }
        .remove-link { color: #e74c3c; text-decoration: none; font-size: 0.8rem; margin-top: 5px; display: block;}
        .checkout-btn { 
            background: #2ecc71; color: white; border: none; 
            padding: 15px 30px; font-size: 1.1rem; border-radius: 5px; 
            cursor: pointer; float: right; margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="cart-container">
        <h2>Your Shopping Cart (${cartCount})</h2>
        <hr>
        
        <c:choose>
            <c:when test="${empty cartItems}">
                <div style="text-align: center; padding: 50px;">
                    <p>Your cart is empty.</p>
                    <a href="home" class="btn">Return to Shop</a>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="item" items="${cartItems}">
    <div class="cart-item" style="display: flex; justify-content: space-between; padding: 15px; border-bottom: 1px solid #eee;">
        <div class="item-info">
            <strong style="text-transform: capitalize;">
                <c:choose>
                    <c:when test="${item == 'midnight'}">The Midnight Library</c:when>
                    <c:when test="${item == 'dune'}">Dune</c:when>
                    <c:when test="${item == 'hailmary'}">Project Hail Mary</c:when>
                    <c:when test="${item == 'miller'}">Circe</c:when>
                    <c:otherwise>${item}</c:otherwise> 
                </c:choose>
            </strong>
        </div>
        <div class="item-actions">
             <form action="removeFromCart" method="POST">
                <input type="hidden" name="id" value="${item}">
                <button type="submit" style="background:none; border:none; color:red; cursor:pointer;">Remove</button>
             </form>
        </div>
    </div>
</c:forEach>
                
                <div style="overflow: auto; margin-top: 30px;">
    <form action="checkout" method="GET">
        <button type="submit" class="checkout-btn">Proceed to Checkout</button>
    </form>
</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>