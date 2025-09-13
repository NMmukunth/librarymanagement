package com.nm.servlet;



import com.nm.dao.userDAO;
import com.nm.model.user;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class userServlet extends HttpServlet {
    private userDAO userDAO;

    public void init() {
        userDAO = new userDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("register".equals(action)) {
            register(req, resp);
        } else if ("login".equals(action)) {
            login(req, resp);
        }
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        user user = new user(name, email, password);
        boolean ok = userDAO.registerUser(user);
        if (ok) {
            resp.sendRedirect("login.jsp");
        } else {
            resp.getWriter().println("Registration failed; check console for errors.");
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        user u = userDAO.loginUser(email, password);
        if (u != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", u);
            resp.sendRedirect("BookServlet?action=list");
        } else {
            resp.getWriter().println("Invalid Email or Password!");
        }
    }
}
