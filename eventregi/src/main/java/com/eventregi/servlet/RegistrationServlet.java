package com.eventregi.servlet;

import com.eventregi.dao.EventDAO;
import com.eventregi.dao.RegistrationDAO;
import com.eventregi.model.Event;
import com.eventregi.model.Registration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    
    private final EventDAO eventDAO = new EventDAO();
    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String eventIdParam = request.getParameter("eventId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        // Validate input
        if (eventIdParam == null || name == null || email == null || 
            eventIdParam.isEmpty() || name.isEmpty() || email.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            
            // Get the event to redisplay the form
            try {
                int eventId = Integer.parseInt(eventIdParam);
                Event event = eventDAO.getEventById(eventId);
                request.setAttribute("event", event);
            } catch (NumberFormatException e) {
                // Invalid event ID
            }
            
            request.getRequestDispatcher("/event-detail.jsp").forward(request, response);
            return;
        }
        
        try {
            int eventId = Integer.parseInt(eventIdParam);
            
            // Create registration object
            Registration registration = new Registration();
            registration.setEventId(eventId);
            registration.setName(name);
            registration.setEmail(email);
            registration.setPhone(phone);
            
            // Save to database
            boolean success = registrationDAO.createRegistration(registration);
            
            if (success) {
                // Get event details for success page
                Event event = eventDAO.getEventById(eventId);
                request.setAttribute("event", event);
                request.setAttribute("registration", registration);
                request.getRequestDispatcher("/registration-success.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to register. Please try again.");
                Event event = eventDAO.getEventById(eventId);
                request.setAttribute("event", event);
                request.getRequestDispatcher("/event-detail.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/events");
        }
    }
}
