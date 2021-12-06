package model.reposiory;

import model.been.Customer;

import java.util.List;

public interface ICustomerRespository {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    boolean remove(int id);

    Customer getCustomerById(int id);

    void updateCustomer(Customer customer);

    List<Customer> search(int id);
}
