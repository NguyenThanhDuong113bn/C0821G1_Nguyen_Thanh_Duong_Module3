package tcomplex.controler;

import tcomplex.bean.MatBang;
import tcomplex.service.IService;
import tcomplex.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "TcomplexServlet", urlPatterns = {"", "/tcomplex_servlet"})
public class TcomplexServlet extends HttpServlet {
    IService iService = new Service();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                try {
                    createMatBang(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
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

    private void searchMatBang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loaiMatBang = request.getParameter("loaiMatBang");
        int soTang = Integer.parseInt(request.getParameter("soTang"));
        double giaThue = Double.parseDouble(request.getParameter("giaThue"));
        List<MatBang> matBangList = iService.searchMatBang(loaiMatBang, giaThue, soTang);
        request.setAttribute("matBangList", matBangList);
        request.getRequestDispatcher("tcomplex/list.jsp").forward(request, response);

    }

    private void deleteMatBang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String maMatBang = request.getParameter("maMatBang");
        this.iService.deleteMatBang(maMatBang);
        getList(request, response);
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


        MatBang matBang = new MatBang(maMatBang, trangThai, dienTich, soTang, loaiMatBang, giaThue, ngayBatDau, ngayKetThuc);
        boolean check = false;
        for (MatBang matBang1 : iService.getList()) {
            if (matBang1.getMaMatBang().equals(matBang.getMaMatBang())) {
                check = false;
                break;
            } else {
                check = true;
            }
        }

        if (!check) {
            request.setAttribute("messenger", "Mã mặt bằng đã tồn tại ");
            request.getRequestDispatcher("tcomplex/create.jsp").forward(request, response);
        }
        boolean check2 = this.iService.createMatBang(matBang);
        if (!check2) {
            request.setAttribute("messenger", " có lỗi validate");
            request.getRequestDispatcher("tcomplex/create.jsp").forward(request, response);
        } else {
            request.setAttribute("messenger", "Tạo mới thành công");
            getList(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choose = request.getParameter("choose");

        if (choose == null) {
            choose = "";
        }
        switch (choose) {
            case "create":
                goPageCreate(request, response);
                break;
            case "edit":
                break;
            default:
                getList(request, response);
                break;
        }
    }

    private void goPageCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("tcomplex/create.jsp").forward(request, response);
    }

    private void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MatBang> matBangList = this.iService.getList();
        request.setAttribute("matBangList", matBangList);
        request.getRequestDispatcher("tcomplex/list.jsp").forward(request, response);
    }
}
