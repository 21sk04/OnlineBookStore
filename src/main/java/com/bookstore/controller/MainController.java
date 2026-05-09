package com.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    // --- 1. THE OPEN ROUTES (No Login Required) ---

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; 
    }

    @PostMapping("/doLogin")
    public String handleLogin(@RequestParam("username") String user, 
                              @RequestParam("password") String pass, 
                              Model model, HttpSession session) {
        
        if ("admin".equals(user) && "password123".equals(pass)) {
            session.setAttribute("user", user);
            return "redirect:/home"; 
        } else {
            model.addAttribute("error", "Invalid Username or Password");
            return "login"; 
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Destroys the session
        return "redirect:/login";
    }

    // --- 2. THE PROTECTED ROUTES (Login Check Added) ---

    @GetMapping({"/", "/home"}) 
    public String showHomePage(HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        return "home"; 
    }

    @GetMapping("/product")
    public String showProduct(@RequestParam("id") String bookId, HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        model.addAttribute("id", bookId);
        if (bookId.equals("midnight")) {
            model.addAttribute("title", "The Midnight Library");
            model.addAttribute("author", "Matt Haig");
            model.addAttribute("price", "$22.00");
            model.addAttribute("desc", "Between life and death there is a library...");
        } 
        else if (bookId.equals("dune")) {
            model.addAttribute("title", "Dune");
            model.addAttribute("author", "Frank Herbert");
            model.addAttribute("price", "$19.99");
            model.addAttribute("desc", "A sprawling epic of space, spice, and sand.");
        } 
        else if (bookId.equals("hailmary")) {
            model.addAttribute("title", "Project Hail Mary");
            model.addAttribute("author", "Andy Weir");
            model.addAttribute("price", "$25.50");
            model.addAttribute("desc", "A science-fiction thriller about a lone survivor.");
        }
        else if (bookId.equals("miller")) {
            model.addAttribute("title", "Circe");
            model.addAttribute("author", "Madeline Miller");
            model.addAttribute("price", "$35.00");
            model.addAttribute("desc", "In the house of Helios, god of the sun, a daughter is born.");
        }
        else {
            model.addAttribute("title", "Book Not Found");
            model.addAttribute("author", "Unknown");
            model.addAttribute("price", "N/A");
            model.addAttribute("desc", "Sorry, the book you are looking for does not exist.");
        }
        return "product";
    }

    @GetMapping("/search")
    public String handleSearch(@RequestParam("query") String query, HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        String find = query.toLowerCase().trim();
        if (find.contains("midnight")) return "redirect:/product?id=midnight";
        if (find.contains("dune")) return "redirect:/product?id=dune";
        if (find.contains("mary") || find.contains("hail")) return "redirect:/product?id=hailmary";
        if (find.contains("circe") || find.contains("miller")) return "redirect:/product?id=miller";
        return "redirect:/home";
    }
    
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("id") String bookId, 
                            @RequestParam(value = "quantity", defaultValue = "1") int qty, 
                            HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        if (bookId == null || bookId.trim().isEmpty()) return "redirect:/home";

        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart == null) { cart = new ArrayList<>(); }
        for(int i = 0; i < qty; i++) { cart.add(bookId.trim()); }
        
        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.size());
        return "redirect:/home";
    }
    
    @GetMapping("/cart")
    public String showCart(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        List<String> cart = (List<String>) session.getAttribute("cart");
        model.addAttribute("cartItems", cart);
        return "cart";
    }
    
    @PostMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("id") String bookId, HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart != null) {
            cart.remove(bookId);
            session.setAttribute("cartCount", cart.size());
        }
        return "redirect:/cart";
    }

    @GetMapping("/clear")
    public String clearCart(HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        session.removeAttribute("cart");
        session.setAttribute("cartCount", 0);
        return "redirect:/cart";
    }
    
    @GetMapping("/checkout")
    public String showCheckout(HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        List<String> items = (List<String>) session.getAttribute("cart");
        double totalAmount = 0.0;
        if (items != null) {
            for (String id : items) {
                if (id.equals("dune")) totalAmount += 19.99;
                else if (id.equals("midnight")) totalAmount += 22.00;
                else if (id.equals("hailmary")) totalAmount += 25.50;
                else if (id.equals("miller")) totalAmount += 35.00;
                else totalAmount += 10.00;
            }
        }
        model.addAttribute("cartItems", items);
        model.addAttribute("totalPrice", totalAmount);
        return "checkout";
    }

    @PostMapping("/placeOrder")
    public String handleOrder(@RequestParam("customerName") String name,
                              @RequestParam("customerEmail") String email,
                              HttpSession session, Model model) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        
        List<String> cart = (List<String>) session.getAttribute("cart");
        double totalAmount = 0.0;
        if (cart != null) {
            for (String id : cart) {
                if (id.equals("dune")) totalAmount += 19.99;
                else if (id.equals("midnight")) totalAmount += 22.00;
                else if (id.equals("hailmary")) totalAmount += 25.50;
                else if (id.equals("miller")) totalAmount += 35.00;
                else totalAmount += 10.00;
            }
        }
        model.addAttribute("customerName", name);
        model.addAttribute("email", email);
        model.addAttribute("itemCount", cart != null ? cart.size() : 0);
        model.addAttribute("totalPrice", totalAmount); 
        session.removeAttribute("cart");
        session.setAttribute("cartCount", 0);
        return "orderSuccess";
    }
    
    @GetMapping("/shop")
    public String showAllBooks(HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        return "home"; 
    }
    
    @GetMapping("/about")
    public String showAboutPage(HttpSession session) {
        if (session.getAttribute("user") == null) return "redirect:/login";
        return "about"; 
    }
    
   
}
