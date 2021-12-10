package model.service.implement;


import model.been.RentType;
import model.reposiory.IRentTypeRespository;
import model.reposiory.Implement.RentTypeRespositoryImpl;
import model.service.IRentTypeService;

import java.util.List;

public class RentTypeServiceImpl implements IRentTypeService {
    IRentTypeRespository iRentTypeRespository = new RentTypeRespositoryImpl();
    @Override
    public List<RentType> getList() {
        return iRentTypeRespository.getList();
    }
}