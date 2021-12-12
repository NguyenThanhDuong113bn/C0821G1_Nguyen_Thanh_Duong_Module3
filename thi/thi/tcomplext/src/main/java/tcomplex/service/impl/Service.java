package tcomplex.service.impl;

import tcomplex.bean.MatBang;
import tcomplex.common.ICommon;
import tcomplex.common.impl.Common;
import tcomplex.repository.IRepesitory;
import tcomplex.repository.impl.Repository;
import tcomplex.service.IService;

import java.sql.SQLException;
import java.util.List;

public class Service implements IService {
    IRepesitory iRepesitory = new Repository();
    ICommon iCommon =new Common();
    @Override
    public List<MatBang> getList() {
        return iRepesitory.getList();
    }

    @Override
    public boolean createMatBang(MatBang matBang) throws SQLException {
        if (!iCommon.checkMatBang(matBang)){
           return false ;
        }else {
            iRepesitory.createMatBang(matBang);
            return true;
        }

    }

    @Override
    public void deleteMatBang(String maMatBang) throws SQLException {
        iRepesitory.deleteMatBang(maMatBang);
    }

    @Override
    public List<MatBang> searchMatBang(String loaiMatBang, double giaThue, int soTang) {
        return iRepesitory.searchMatBang(loaiMatBang,giaThue,soTang);
    }
}
