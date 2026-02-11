package test;

import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.annotation.WebServlet;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch(action) {
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUsers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch(action) {
            case "insert":
                insertUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            default:
                listUsers(request, response);
                break;
        }
    }

    // ------------------ Methods ------------------

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userDAO.getAllUsers();
        request.setAttribute("userList", users);

        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("addUser.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        List<User> users = userDAO.getAllUsers();
        User userToEdit = users.stream().filter(u -> u.getId() == id).findFirst().orElse(null);

        request.setAttribute("user", userToEdit);

        RequestDispatcher dispatcher = request.getRequestDispatcher("editUser.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        userDAO.addUser(firstName, lastName, email, password);

        response.sendRedirect(request.getContextPath() + "/UserServlet");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        userDAO.updateUser(id, firstName, lastName, email);

        response.sendRedirect(request.getContextPath() + "/UserServlet");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);

        response.sendRedirect(request.getContextPath() + "/UserServlet");
    }
}

