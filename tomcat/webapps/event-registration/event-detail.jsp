<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register for ${event.name}</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Event Registration System</h1>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/events">Events</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <div class="event-detail">
                <h2>${event.name}</h2>
                <p class="event-date">
                    <fmt:parseDate value="${event.date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                    <fmt:formatDate value="${parsedDate}" pattern="MMMM d, yyyy 'at' h:mm a" />
                </p>
                <p class="event-location">${event.location}</p>
                <p>${event.description}</p>
            </div>
            
            <div class="registration-form">
                <h3>Register for this Event</h3>
                
                <c:if test="${not empty error}">
                    <div class="error-message">
                        <p>${error}</p>
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/register" method="post">
                    <input type="hidden" name="eventId" value="${event.id}">
                    
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone">
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn">Register</button>
                    </div>
                </form>
            </div>
        </main>
        
        <footer>
            <p>© 2023 Event Registration System</p>
        </footer>
    </div>
</body>
</html>
