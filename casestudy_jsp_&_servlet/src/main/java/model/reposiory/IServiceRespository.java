package model.reposiory;

import model.been.Service;

import java.util.List;

public interface IServiceRespository {
    List<Service> findAll();
    //    Customer getServiceById(int id);
    void save(Service service);
}

