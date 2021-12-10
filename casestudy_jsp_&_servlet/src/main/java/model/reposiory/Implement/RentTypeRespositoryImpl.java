package model.reposiory.Implement;


import model.been.RentType;
import model.reposiory.DBConnection;
import model.reposiory.IRentTypeRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRespositoryImpl implements IRentTypeRespository {
    private static final String  SELECT_RENT_TYPE = "select * from rent_type";
    @Override
    public List<RentType> getList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<RentType> rentTypeList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_RENT_TYPE);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("rent_type_id");
                    String name = resultSet.getString("rent_type_name");
                    double code = resultSet.getDouble("rent_type_cost");
                    RentType rentType = new RentType(id,name,code);
                    rentTypeList.add(rentType);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return rentTypeList;

    }

}