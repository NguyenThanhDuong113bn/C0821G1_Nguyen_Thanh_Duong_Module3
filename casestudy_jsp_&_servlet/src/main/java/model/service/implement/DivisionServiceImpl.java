package model.service.implement;


import model.been.Division;
import model.reposiory.IDivisionRespository;
import model.reposiory.Implement.DivisionRespositoryImpl;
import model.service.IDivisionService;

import java.util.List;

public class DivisionServiceImpl implements IDivisionService {
    IDivisionRespository iDivisionRespository = new DivisionRespositoryImpl();
    @Override
    public List<Division> getList() {
        return iDivisionRespository.getList();
    }
}