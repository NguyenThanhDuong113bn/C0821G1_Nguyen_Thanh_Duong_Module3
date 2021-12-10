package model.reposiory.Implement;


import model.been.Division;
import model.reposiory.DBConnection;
import model.reposiory.IDivisionRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRespositoryImpl implements IDivisionRespository {
    private static final String  SELECT_DIVISION = "select * from division";
    @Override
    public List<Division> getList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Division> divisionList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_DIVISION);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int division_id = resultSet.getInt("division_id");
                    String division_name = resultSet.getString("division_name");

                    Division division = new Division(division_id,division_name);
                    divisionList.add(division);
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
        return divisionList;
    }
}