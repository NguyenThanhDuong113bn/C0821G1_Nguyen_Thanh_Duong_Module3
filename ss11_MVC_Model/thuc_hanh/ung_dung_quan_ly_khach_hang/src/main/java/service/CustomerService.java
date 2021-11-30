package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAdd ();
    void save (Customer customer);
    Customer findById (int id);
    void update (int id, Customer customer);
    void remove (int id);
}
