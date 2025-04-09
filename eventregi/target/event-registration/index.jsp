<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registration - Home</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Event Registration System</h1>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/" class="active">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/events">Events</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <section class="hero">
                <h2>Welcome to Event Registration</h2>
                <p>Browse our upcoming events and register to attend!</p>
                <a href="${pageContext.request.contextPath}/events" class="btn">View Events</a>
            </section>
            
            <section class="features">
                <div class="feature">
                    <h3>Easy Registration</h3>
                    <p>Register for events with just a few clicks.</p>
                </div>
                <div class="feature">
                    <h3>Diverse Events</h3>
                    <p>From tech conferences to music festivals, we have it all.</p>
                </div>
                <div class="feature">
                    <h3>Stay Updated</h3>
                    <p>Get information about upcoming events.</p>
                </div>
            </section>
        </main>
        
        <footer>
            <p>© 2023 Event Registration System</p>
        </footer>
    </div>
</body>
</html>
