package model.repository;

import model.been.MatBang;

import java.sql.SQLException;
import java.util.List;

public interface IRepository {
    List<MatBang> getList();
    List<MatBang> searchMatBang(String loaiMatBang, double giaThue, int soTang);

   void createMatBang(MatBang matBang) throws SQLException;

    void deleteMatBang(String maMatBang) throws  SQLException;
}

