package controller;

import model.been.User;
import model.service.UserService;
import model.service.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@javax.servlet.annotation.WebServlet(name = "UserServlet", urlPatterns = {"", "/users"})
public class UserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                insertUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
            case "search":
                searchUser(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }
    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        try {
            List<User> listUser = userService.findByCountry(country);
            request.setAttribute("listUser", listUser);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/view.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException | IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = userService.selectUser(id);
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        try {
            userService.updateUser(user);
            listUser(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        try {
//            userService.insertUser(newUser);
            userService.insertUserStore(newUser);
            listUser(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "sort":
                sortByName(request, response);
                break;
            case "permision":
                addUserPermision(request, response);
                break;
            case "test-without-tran":
                testWithoutTran(request, response);
                break;
            case "test-use-tran":
                testUseTran(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }
    private void testUseTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateUseTransaction();
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateWithoutTransaction();
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");

        int[] permision = {1, 2, 4};

        userService.addUserTransaction(user, permision);
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<User> userList = userService.sortByName();
            request.setAttribute("listUser", userList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            userService.deleteUser(id);
            request.setAttribute("listUser", userService.selectAllUsers());
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | IOException | ServletException throwables) {
            throwables.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
//        request.setAttribute("user", userService.selectUser(id));
        request.setAttribute("user", userService.getUserById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
