package controller;

import model.been.RentType;
import model.been.Service;
import model.been.ServiceType;
import model.service.IRentTypeService;
import model.service.IServiceService;
import model.service.IServiceTypeService;
import model.service.implement.RentTypeServiceImpl;
import model.service.implement.ServiceServiceImpl;
import model.service.implement.ServiceTypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/service")
public class ServiceServlet extends HttpServlet {
    IServiceService iServiceService = new ServiceServiceImpl();

    IServiceTypeService iServiceTypeService = new ServiceTypeServiceImpl();
    IRentTypeService iRentTypeService = new RentTypeServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_service":
                createService(request, response);
                break;
//            case "edit":
//                updateCustomer(request, response);
//                break;
//            case "find":
//                findCustomer(request, response);
//                break;
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        String service_name = request.getParameter("service_name");
        int service_area = Integer.parseInt(request.getParameter("service_area"));
        double service_cost = Double.parseDouble(request.getParameter("service_cost"));
        int service_max_people = Integer.parseInt(request.getParameter("service_max_people"));
        int rent_type_id = Integer.parseInt(request.getParameter("rent_type_id"));
        int service_type_id = Integer.parseInt(request.getParameter("service_type_id"));
        String standard_room = request.getParameter("standard_room");
        String description = request.getParameter("description");
        double pool_area = Double.parseDouble(request.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(request.getParameter("number_of_floors"));
        Service service = new Service(service_name, service_area, service_cost, service_max_people, rent_type_id,
                service_type_id, standard_room, description,pool_area,number_of_floors);
        iServiceService.save(service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        request.setAttribute("message", "Thêm mới thành công  !");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "service":
                    showServiceList(request, response);
                    break;
                case "create_service":
                    addService(request, response);
                    break;

//                case "delete":
//
//                    deleteCustomer(request, response);
//                    break;
//                case "edit":
//                    showEditForm(request, response);
//                    break;
//                case "search":
//                    search(request, response);
//                    break;
                default:
                    showServiceList(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void addService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ServiceType> serviceTypeList = iServiceTypeService.getList();
        request.setAttribute("serviceTypeList", serviceTypeList);

        List<RentType> rentTypeList = iRentTypeService.getList();
        request.setAttribute("rentTypeList", rentTypeList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        dispatcher.forward(request, response);
    }




    private void showServiceList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> serviceList = iServiceService.findAll();
        request.setAttribute("listService", serviceList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }
}