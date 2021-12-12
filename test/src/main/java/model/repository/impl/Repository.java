package model.repository.impl;

import model.been.MatBang;
import model.repository.DBConnection;
import model.repository.IRepository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository {

    @Override
    public List<MatBang> getList() {
        List<MatBang> matBangList = new ArrayList<>();

        String query = "select *\n" +
                "from mat_bang\n" +
                "order by dien_tich;";

        try {
            Statement statement = DBConnection.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            MatBang matBang ;
            while (resultSet.next()) {
                matBang = new MatBang();
                matBang.setMaMatBang(resultSet.getString("ma_mat_bang"));
                matBang.setTrangThai(resultSet.getString("trang_thai"));
                matBang.setDienTich(Double.parseDouble(resultSet.getString("dien_tich")));
                matBang.setSoTang(Integer.parseInt(resultSet.getString("so_tang")));
                matBang.setLoaiMatBang(resultSet.getString("loai_mat_bang"));
                matBang.setGiaThue(Double.parseDouble(resultSet.getString("gia_the")));
                matBang.setNgayBatDau(resultSet.getString("ngay_bat_dau"));
                matBang.setNgayKetThuc(resultSet.getString("ngay_ket_thuc"));

                matBangList.add(matBang);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return matBangList;
    }



    @Override
    public List<MatBang> searchMatBang(String loaiMatBang, double giaThue, int soTang) {
        List<MatBang> matBangList = new ArrayList<>();



        String query = "select *\n" +
                "from mat_bang\n" +
                "where loai_mat_bang = ? and gia_the = ? and so_tang = ?;";
        try (
                PreparedStatement preparedStatement =
                       DBConnection.connection.prepareStatement(query)) {
            preparedStatement.setString(1, loaiMatBang);
            preparedStatement.setString(2, String.valueOf(giaThue));
            preparedStatement.setString(3, String.valueOf(soTang));
            ResultSet resultSet = preparedStatement.executeQuery();


            MatBang matBang;

            while (resultSet.next()) {
                matBang = new MatBang();
                matBang.setMaMatBang(resultSet.getString("ma_mat_bang"));
                matBang.setTrangThai(resultSet.getString("trang_thai"));
                matBang.setDienTich(Double.parseDouble(resultSet.getString("dien_tich")));
                matBang.setSoTang(Integer.parseInt(resultSet.getString("so_tang")));
                matBang.setLoaiMatBang(resultSet.getString("loai_mat_bang"));
                matBang.setGiaThue(Double.parseDouble(resultSet.getString("gia_the")));
                matBang.setNgayBatDau(resultSet.getString("ngay_bat_dau"));
                matBang.setNgayKetThuc(resultSet.getString("ngay_ket_thuc"));



                matBangList.add(matBang);
            }
        } catch (SQLException e) {
            e.getErrorCode();
        }
        return matBangList;
    }

    @Override
    public void createMatBang(MatBang matBang) throws SQLException {
        String query = "insert mat_bang \n" +
                "values\n" +
                "(?,?,?,?,?,?,?,?);";
        PreparedStatement preparedStatement =
                DBConnection.connection.prepareStatement(query);
        preparedStatement.setString(1, matBang.getMaMatBang());
        preparedStatement.setString(2, matBang.getTrangThai());
        preparedStatement.setString(3, String.valueOf(matBang.getDienTich()));
        preparedStatement.setString(4, String.valueOf(matBang.getSoTang()));
        preparedStatement.setString(5, matBang.getLoaiMatBang());
        preparedStatement.setString(6, String.valueOf(matBang.getGiaThue()));
        preparedStatement.setString(7, matBang.getNgayBatDau());
        preparedStatement.setString(8, matBang.getNgayKetThuc());

        preparedStatement.executeUpdate();

    }

    @Override
    public void deleteMatBang(String maMatBang) throws SQLException {
        String query = "delete from mat_bang\n" +
                "where ma_mat_bang = ?;";


        PreparedStatement preparedStatement =
                DBConnection.connection.prepareStatement(query);

        preparedStatement.setString(1, maMatBang);
        preparedStatement.executeUpdate();

    }

}
