package com.swiftbus.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/logout")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // get existing session, do not create new one
        if (session != null) {
            session.invalidate(); // destroy session
        }
        response.sendRedirect(request.getContextPath() + "/admin/login"); // redirect to login page
    }
}