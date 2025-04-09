<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
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
            <div class="success-message">
                <h2>Registration Successful!</h2>
                <p>Thank you for registering for <strong>${event.name}</strong>.</p>
                
                <div class="registration-details">
                    <h3>Registration Details</h3>
                    <p><strong>Name:</strong> ${registration.name}</p>
                    <p><strong>Email:</strong> ${registration.email}</p>
                    <p><strong>Phone:</strong> ${registration.phone}</p>
                    <p><strong>Event:</strong> ${event.name}</p>
                    <p><strong>Date:</strong> 
                        <fmt:parseDate value="${event.date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                        <fmt:formatDate value="${parsedDate}" pattern="MMMM d, yyyy 'at' h:mm a" />
                    </p>
                    <p><strong>Location:</strong> ${event.location}</p>
                </div>
                
                <p>We've sent a confirmation email to your registered email address.</p>
                <a href="${pageContext.request.contextPath}/events" class="btn">Browse More Events</a>
            </div>
        </main>
        
        <footer>
            <p>© 2023 Event Registration System</p>
        </footer>
    </div>
</body>
</html>
