package model.service.implement;


import model.been.CustomerType;
import model.reposiory.ICustomerTypeRespository;
import model.reposiory.Implement.CustomerTypeRespositoryImpl;
import model.service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    ICustomerTypeRespository iCustomerTypeRepository = new CustomerTypeRespositoryImpl();
    @Override
    public List<CustomerType> getList() {
        return iCustomerTypeRepository.getList();
    }
}