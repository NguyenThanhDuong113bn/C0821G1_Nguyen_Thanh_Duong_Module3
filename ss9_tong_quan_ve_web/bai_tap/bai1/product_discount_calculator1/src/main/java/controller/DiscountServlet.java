package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int listPrice = Integer.parseInt(request.getParameter("price"));
        int discountPercent = Integer.parseInt(request.getParameter("percent"));

        int discountAmount = (int) (listPrice * discountPercent * 0.01);
        int Price = listPrice - discountAmount;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Discount Amount: " + discountAmount + "</h1>");
        writer.println("<h1>Discount Price: " + Price + "</h1>");
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
