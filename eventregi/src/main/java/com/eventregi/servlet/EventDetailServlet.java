package com.eventregi.servlet;

import com.eventregi.dao.EventDAO;
import com.eventregi.model.Event;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/event")
public class EventDetailServlet extends HttpServlet {
    
    private final EventDAO eventDAO = new EventDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String eventIdParam = request.getParameter("id");
        
        if (eventIdParam != null && !eventIdParam.isEmpty()) {
            try {
                int eventId = Integer.parseInt(eventIdParam);
                Event event = eventDAO.getEventById(eventId);
                
                if (event != null) {
                    request.setAttribute("event", event);
                    request.getRequestDispatcher("/event-detail.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Invalid event ID format
            }
        }
        
        // If we get here, redirect to events list
        response.sendRedirect(request.getContextPath() + "/events");
    }
}
