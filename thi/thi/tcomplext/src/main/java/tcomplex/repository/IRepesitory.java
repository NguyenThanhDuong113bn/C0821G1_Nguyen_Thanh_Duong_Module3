package tcomplex.repository;

import tcomplex.bean.MatBang;

import java.sql.SQLException;
import java.util.List;

public interface IRepesitory {
    List<MatBang> getList();

    void createMatBang(MatBang matBang) throws SQLException;

    void deleteMatBang(String maMatBang) throws SQLException;

    List<MatBang> searchMatBang(String loaiMatBang, double giaThue, int soTang);
}
