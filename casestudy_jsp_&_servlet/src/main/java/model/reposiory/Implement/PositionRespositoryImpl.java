package model.reposiory.Implement;

import model.been.Position;
import model.reposiory.DBConnection;
import model.reposiory.IPositionRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRespositoryImpl implements IPositionRespository {
    private static final String  SELECT_POSITION = "select * from position";
    @Override
    public List<Position> getList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Position> positionList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_POSITION);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int position_id = resultSet.getInt("position_id");
                    String position_name = resultSet.getString("position_name");

                    Position position = new Position(position_id,position_name);
                    positionList.add(position);
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
        return positionList;
    }
}