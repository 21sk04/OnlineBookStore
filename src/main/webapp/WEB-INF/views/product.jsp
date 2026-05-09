<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details | Novella Books</title>
    <style>
        /* Shared Styles from Home Page */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body { background-color: #f4f7f6; color: #333; }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 8%;
            background: #2c3e50;
            color: white;
        }

        .logo span { color: #e67e22; }
        .nav-links { list-style: none; display: flex; }
        .nav-links li { margin: 0 15px; }
        .nav-links a { color: white; text-decoration: none; }

        /* Product Section */
        .product-container {
            max-width: 1100px;
            margin: 50px auto;
            display: flex;
            gap: 50px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        /* Left: Book Image */
        .product-image {
    flex: 1;
    border-radius: 8px;
    overflow: hidden;        /* ADD THIS */
    border: 1px solid #ddd;
}
.product-image img {
    width: 100%;
    height: 400px;        /* reduce from 500px */
    object-fit: contain;  /* change cover → contain */
    border-radius: 8px;
    display: block;
    background: #f4f4f4;
}

        /* Right: Book Details */
        .product-details {
            flex: 1.2;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .product-details h1 {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .author {
            font-size: 1.2rem;
            color: #e67e22;
            margin-bottom: 20px;
            font-style: italic;
        }

        .rating {
            color: #f1c40f;
            margin-bottom: 20px;
        }

        .price {
            font-size: 2rem;
            font-weight: bold;
            color: #27ae60;
            margin-bottom: 20px;
        }

        .description {
            line-height: 1.6;
            color: #7f8c8d;
            margin-bottom: 30px;
        }

        /* Controls */
        .controls {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        input[type="number"] {
            width: 60px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .add-to-cart-btn {
            background: #e67e22;
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            transition: 0.3s;
        }

        .add-to-cart-btn:hover {
            background: #d35400;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .product-container {
                flex-direction: column;
                margin: 20px;
            }
            .product-image { height: 350px; }
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
   

    <div class="product-container">
        <!-- Image Area -->
       <!-- Image Area -->
<div class="product-image">
    <img src="${pageContext.request.contextPath}/resources/images/${id}.jpeg" 
         alt="${title}">
</div>

        <!-- ... existing code (Image area) ... -->

<!-- REPLACE THE OLD INFO AREA WITH THIS -->
<div class="product-details">
    <h1>${title}</h1>
    <p class="author">By ${author}</p>
    
    <div class="rating">
        ★★★★☆ <span style="color: #7f8c8d; font-size: 0.9rem;">(Verified)</span>
    </div>

    <p class="price">${price}</p>

    <p class="description">
        ${desc}
    </p>

    <div class="controls">
        <form action="addToCart" method="POST" style="display: flex; gap: 10px; align-items: center;">
            <input type="hidden" name="id" value="${id.trim()}"> <input type="number" name="quantity" value="1" min="1" 
                   style="width: 60px; padding: 8px; border: 1px solid #ddd; border-radius: 4px;">
            <button type="submit" class="add-to-cart-btn" 
                    style="background: #e67e22; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">
                Add to Shopping Cart
            </button>
        </form>
    </div>
    
    <p style="margin-top: 20px; font-size: 0.9rem; color: #27ae60;">✔ In Stock - Ready to ship</p>
</div>
<!-- ... rest of the file ... -->
    </div>

</body>
</html>