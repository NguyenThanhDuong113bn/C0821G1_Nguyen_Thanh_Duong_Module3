package model.service.implement;


import model.been.Customer;
import model.reposiory.ICustomerRespository;
import model.reposiory.Implement.CustomerRespositoryImpl;
import model.service.ICustomerService;

import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerRespository iCustomerRespository =  new CustomerRespositoryImpl();
    @Override
    public List<Customer> findAll() {
        return iCustomerRespository.findAll();
    }

    @Override
    public void save(Customer customer) {
        iCustomerRespository.save(customer);
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRespository.findById(id);
    }

    @Override
    public void remove(int id) {
        iCustomerRespository.remove(id);
    }

    @Override
    public Customer getCustomerById(int id) {
        return iCustomerRespository.getCustomerById(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        iCustomerRespository.updateCustomer(customer);
    }

    @Override
    public List<Customer> search(int id) {
        return iCustomerRespository.search(id);
    }
}