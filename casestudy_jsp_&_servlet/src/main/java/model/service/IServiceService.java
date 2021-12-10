package model.service;

import model.been.Service;

import java.util.List;

public interface IServiceService {
    List<Service> findAll();
    //    Customer getServiceById(int id);
    void save(Service service);
}
