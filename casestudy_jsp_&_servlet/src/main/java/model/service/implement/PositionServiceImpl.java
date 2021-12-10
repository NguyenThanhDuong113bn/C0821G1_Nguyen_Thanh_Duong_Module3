package model.service.implement;


import model.been.Position;
import model.reposiory.IPositionRespository;
import model.reposiory.Implement.PositionRespositoryImpl;
import model.service.IPositionService;

import java.util.List;

public class PositionServiceImpl implements IPositionService {
    IPositionRespository iPositionRespository=new PositionRespositoryImpl();
    @Override
    public List<Position> getList() {
        return iPositionRespository.getList();
    }
}