package model.service;

import model.been.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void remove(int id);

    Customer getCustomerById(int id);

    void updateCustomer(Customer customer);

    List<Customer> search(int id);
}
