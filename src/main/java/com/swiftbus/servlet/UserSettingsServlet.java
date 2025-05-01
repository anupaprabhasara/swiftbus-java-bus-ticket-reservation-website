package com.swiftbus.servlet;

import com.swiftbus.model.User;
import com.swiftbus.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/settings")
public class UserSettingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        User user = userService.getUser(userId);

        request.setAttribute("user", user);
        request.setAttribute("isLoggedIn", true);
        request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        User user = userService.getUser(userId);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String newPassword = request.getParameter("new_password");
        String currentPassword = request.getParameter("current_password");

        if (!user.getPassword().equals(currentPassword)) {
            request.setAttribute("user", user);
            request.setAttribute("error", "Incorrect current password.");
            request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
            return;
        }

        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);

        if (newPassword != null && !newPassword.trim().isEmpty()) {
            user.setPassword(newPassword);
        }

        boolean updated = userService.updateUser(user);
        if (updated) {
            session.setAttribute("name", user.getName());
            request.setAttribute("user", user);
            request.setAttribute("success", "Profile updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update profile.");
        }

        request.getRequestDispatcher("/client/settings.jsp").forward(request, response);
    }
}