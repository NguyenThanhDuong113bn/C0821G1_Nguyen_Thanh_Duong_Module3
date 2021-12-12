package model.service.impl;

import model.been.MatBang;
import model.repository.IRepository;
import model.repository.impl.Repository;
import model.service.IService;

import java.sql.SQLException;
import java.util.List;

public class Service implements IService {
    IRepository iRepository = new Repository();


    @Override
    public List<MatBang> getList() {
        return iRepository.getList();
    }

    @Override
    public void createMatBang(MatBang matBang) throws SQLException {
       iRepository.createMatBang(matBang);
    }

    @Override
    public void deleteMatBang(String maMatBang) throws SQLException {
        iRepository.deleteMatBang(maMatBang);
    }


    @Override
    public List<MatBang> searchMatBang(String loaiMatBang, double giaThue, int soTang) {
        return iRepository.searchMatBang(loaiMatBang,giaThue,soTang);
    }
}
