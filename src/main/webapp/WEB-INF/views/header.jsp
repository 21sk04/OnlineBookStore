<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
    /* Navigation Bar Styling */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 8%;
        background: #2c3e50; /* Dark blue-grey */
        color: white;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        text-decoration: none;
        color: white;
    }

    .logo span {
        color: #e67e22; /* Bookish Orange */
    }

    .nav-links {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
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

    .cart-count {
        background: #e67e22;
        color: white;
        padding: 2px 8px;
        border-radius: 50%;
        font-size: 0.8rem;
        margin-left: 5px;
    }
    .search-form {
    display: flex;
    align-items: center;
    margin: 0 15px; /* Adds space around the search bar */
}

.search-form input {
    padding: 5px 10px;
    border: 1px solid #ccc;
    border-radius: 4px 0 0 4px;
    outline: none;
    font-size: 0.9rem;
}

.search-form button {
    padding: 5px 10px;
    background-color: #ff4d4d; /* Or your theme color */
    color: white;
    border: none;
    border-radius: 0 4px 4px 0;
    cursor: pointer;
    transition: background 0.3s;
}

.search-form button:hover {
    background-color: #e60000;
}
</style>
</head>
<body>
<nav class="navbar">
    <a href="home" class="logo">Novella<span>Books</span></a>
    
    <ul class="nav-links">
        <li><a href="home">Home</a></li>
        <li><a href="shop">All Books</a></li>
        
        <li>
            <form action="search" method="GET" class="search-form">
                <input type="text" name="query" placeholder="Search books...">
                <button type="submit">Search</button>
            </form>
        </li>
        
        <li><a href="about">About Us</a></li>
        <li><a href="login">Login</a></li>
        <li>
            <a href="cart" class="cart-btn">
    Cart <span class="cart-count">${cartCount != null ? cartCount : 0}</span>
</a>
        </li>
        <li class="nav-item">
   <a href="logout" style="margin-left: 20px; color: #ff6b6b; border: 1px solid #ff6b6b; padding: 5px 10px; border-radius: 4px; text-decoration: none;">Logout</a>
</li>
    </ul>
</nav>


</body>
</html>