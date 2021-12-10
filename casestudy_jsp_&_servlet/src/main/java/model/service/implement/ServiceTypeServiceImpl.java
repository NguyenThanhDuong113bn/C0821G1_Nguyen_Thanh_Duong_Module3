package model.service.implement;


import model.been.ServiceType;
import model.reposiory.IServiceTypeRespository;
import model.reposiory.Implement.ServiceTypeRespositoryImpl;
import model.service.IServiceTypeService;

import java.util.List;

public class ServiceTypeServiceImpl implements IServiceTypeService {
    IServiceTypeRespository iServiceTypeRespository = new ServiceTypeRespositoryImpl();
    @Override
    public List<ServiceType> getList() {
        return iServiceTypeRespository.getList();
    }
}
