package tcomplex.service;

import tcomplex.bean.MatBang;

import java.sql.SQLException;
import java.util.List;

public interface IService {
    List<MatBang> getList();

    boolean createMatBang(MatBang matBang) throws SQLException;

    void deleteMatBang(String maMatBang) throws SQLException;


    List<MatBang> searchMatBang(String loaiMatBang, double giaThue, int soTang);
}
