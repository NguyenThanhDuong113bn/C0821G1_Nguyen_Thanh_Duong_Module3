package service;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public static List<Customer> getAllCustomer () {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "anh_1.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1985-04-12", "Đà Nẵng", "anh_2.jpg"));
        customerList.add(new Customer("Lê Thị Thái Hòa", "1980-12-01", "Tp. HCM", "anh_3.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1990-07-17", "Quảng Nam", "anh_4.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1995-01-01", "Hà Nội", "anh_5.jpg"));
        customerList.add(new Customer("Nguyễn Thị Tuyết", "1984-03-18", "Huế", "anh_6.jpg"));
        return customerList;
    }
}