package model.service.implement;


import model.been.Service;
import model.reposiory.IServiceRespository;
import model.reposiory.Implement.ServiceRespositoryImpl;
import model.service.IServiceService;

import java.util.List;

public class ServiceServiceImpl implements IServiceService {
    private IServiceRespository iServiceRespository =  new ServiceRespositoryImpl();
    @Override
    public List<Service> findAll() {
        return iServiceRespository.findAll();
    }

//    @Override
//    public Customer getServiceById(int id) {
//        return iServiceRespository.getServiceById(id);
//    }

    @Override
    public void save(Service service) {
        Service service1 = service;
        iServiceRespository.save(service);
    }
}