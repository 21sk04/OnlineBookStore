<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
        }



        .logo {
            font-size: 24px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .logo span {
            color: #e67e22;
        }

        .nav-links {
            list-style: none;
            display: flex;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #e67e22;
        }

        /* Hero Section */
        .hero {
            height: 450px;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                        url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 25px;
        }

        .btn {
            background: #e67e22;
            padding: 12px 30px;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            background: #d35400;
            box-shadow: 0 4px 15px rgba(230, 126, 34, 0.4);
        }

        /* Book Grid Section */
        .main-content {
            padding: 60px 8%;
        }

        .section-title {
            text-align: center;
            margin-bottom: 40px;
            font-size: 2rem;
            position: relative;
        }

        .section-title::after {
            content: '';
            width: 50px;
            height: 3px;
            background: #e67e22;
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
        }

        .book-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: 0.3s;
        }

        .book-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .book-cover-placeholder {
            width: 100%;
            height: 280px;
            background: #ecf0f1;
            margin-bottom: 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #95a5a6;
            font-weight: bold;
        }

        .book-card h3 {
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .book-card p {
            color: #7f8c8d;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .price {
            display: block;
            font-size: 1.2rem;
            color: #27ae60;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .add-btn {
            width: 100%;
            padding: 10px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }
        .book-cover{
    width: 100%;
    height: 300px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 10px;
}

        .add-btn:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
	

    <header class="hero">
        <div class="hero-content">
            <h1>Escape into a Story</h1>
            <p>Find your next favorite book at the best prices.</p>
            <a href="#shop" class="btn">Start Reading</a>
        </div>
    </header>

    <main class="main-content" id="shop">
        <h2 class="section-title">New Arrivals</h2>
        
        <div class="book-grid">
            <!-- Book 1 -->
            <div class="book-card">
                <img src="<c:url value='/resources/images/midnight.jpeg' />" class="book-cover">
                <a href="product?id=midnight" style="text-decoration:none; color:inherit;"><h3>The Midnight Library</h3></a>
                <p>Matt Haig</p>
                <span class="price">$22.00</span>
                <form action="addToCart" method="POST" style="display: flex; gap: 10px; align-items: center;">
    <input type="hidden" name="id" value="midnight"> 
    
    <input type="number" name="quantity" value="1" min="1" style="width: 50px; padding: 5px;">
    
    <button type="submit" class="add-btn">Add to Cart</button>
</form>
            </div>

            <!-- Book 2 -->
            <div class="book-card">
                <img src="<c:url value='/resources/images/dune.jpeg' />" class="book-cover">
                <a href="product?id=dune" style="text-decoration:none; color:inherit;"><h3>Dune</h3></a>
                <p>Frank Herbert</p>
                <span class="price">$19.99</span>
                <form action="addToCart" method="POST" style="display: flex; gap: 10px; align-items: center;">
    <input type="hidden" name="id" value="dune"> 
    
    <input type="number" name="quantity" value="1" min="1" style="width: 50px; padding: 5px;">
    
    <button type="submit" class="add-btn">Add to Cart</button>
</form>
            </div>

            <!-- Book 3 -->
            <div class="book-card">
                <img src="<c:url value='/resources/images/hailmary.jpeg' />" alt="Project Hail Mary" class="book-cover">
                <a href="product?id=hailmary" style="text-decoration:none; color:inherit;"><h3>Project Hail Mary</h3></a>
                <p>Andy Weir</p>
                <span class="price">$25.50</span>
               <form action="addToCart" method="POST" style="display: flex; gap: 10px; align-items: center;">
    <input type="hidden" name="id" value="hailmary"> 
    
    <input type="number" name="quantity" value="1" min="1" style="width: 50px; padding: 5px;">
    
    <button type="submit" class="add-btn">Add to Cart</button>
</form>
            </div>

            <!-- Book 4 -->
            <div class="book-card">
                <img src="<c:url value='/resources/images/circe.jpeg' />" alt="Circe" class="book-cover">
                <a href="product?id=miller" style="text-decoration:none; color:inherit;"><h3>Circe</h3></a>
                <p>Madeline Miller</p>
                <span class="price">$35.00</span>
                <form action="addToCart" method="POST" style="display: flex; gap: 10px; align-items: center;">
    <input type="hidden" name="id" value="miller"> 
    
    <input type="number" name="quantity" value="1" min="1" style="width: 50px; padding: 5px;">
    
    <button type="submit" class="add-btn">Add to Cart</button>
</form>
            </div>
        </div>
    </main>
</body>
</html>