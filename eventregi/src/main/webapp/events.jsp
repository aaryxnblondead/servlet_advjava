<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registration - Events</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Event Registration System</h1>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/events" class="active">Events</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            <h2>Upcoming Events</h2>
            
            <div class="events-list">
                <c:choose>
                    <c:when test="${empty events}">
                        <p>No events are currently scheduled.</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="event" items="${events}">
                            <div class="event-card">
                                <h3>${event.name}</h3>
                                <p class="event-date">
                                    <fmt:parseDate value="${event.date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                                    <fmt:formatDate value="${parsedDate}" pattern="MMMM d, yyyy 'at' h:mm a" />
                                </p>
                                <p class="event-location">${event.location}</p>
                                <p>${event.description}</p>
                                <a href="${pageContext.request.contextPath}/event?id=${event.id}" class="btn">Register Now</a>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
        
        <footer>
            <p>© 2023 Event Registration System</p>
        </footer>
    </div>
</body>
</html>
