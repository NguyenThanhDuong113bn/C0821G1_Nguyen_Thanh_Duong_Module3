package controller;

import model.been.MatBang;
import model.repository.IRepository;
import model.service.IService;
import model.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "MatBangServlet", urlPatterns = {"", "/matbang"})
public class MatBangServlet extends javax.servlet.http.HttpServlet {
    IService iService = new Service();
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createMatBang(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                break;
            case "delete":
                try {
                    deleteMatBang(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                searchMatBang(request, response);
                break;
       }
    }

    private void deleteMatBang(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String maMatBang = request.getParameter("maMatBang");
        this.iService.deleteMatBang(maMatBang);
       getList(request,response);
    }

    private void createMatBang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        String maMatBang = request.getParameter("maMatBang");
        String trangThai = request.getParameter("trangThai");
        double dienTich = Double.parseDouble(request.getParameter("dienTich"));
        int soTang = Integer.parseInt(request.getParameter("soTang"));
        String loaiMatBang = request.getParameter("loaiMatBang");
        double giaThue = Double.parseDouble(request.getParameter("giaThue"));
        String ngayBatDau = request.getParameter("ngayBatDau");
        String ngayKetThuc = request.getParameter("ngayKetThuc");
        MatBang matBang = new MatBang(maMatBang,trangThai,dienTich,soTang,loaiMatBang,giaThue,ngayBatDau,ngayKetThuc);
        iService.createMatBang(matBang);
        getList(request, response);
    }

    private void searchMatBang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loaiMatBang = request.getParameter("loaiMatBang");
        int soTang = Integer.parseInt(request.getParameter("soTang"));
        double giaThue = Double.parseDouble(request.getParameter("giaThue"));
        List<MatBang> matBangList = iService.searchMatBang(loaiMatBang,giaThue,soTang);
        request.setAttribute("matBangList", matBangList);
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
    }


    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
               request.getRequestDispatcher("view/create.jsp").forward(request,response);
                break;
            case "edit":
                break;
            default:
                getList(request, response);
                break;
        }
    }

    private void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MatBang> matBangList = iService.getList();
        request.setAttribute("matBangList",matBangList);
        request.getRequestDispatcher("view/list.jsp").forward(request,response) ;
    }
}
