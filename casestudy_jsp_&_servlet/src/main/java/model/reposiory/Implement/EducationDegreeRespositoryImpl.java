package model.reposiory.Implement;


import model.been.EducationDegree;
import model.reposiory.DBConnection;
import model.reposiory.IEducationDegreeRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRespositoryImpl implements IEducationDegreeRespository {
    private static final String  SELECT_EDUCATION_DEGREE = "select * from education_degree";
    @Override
    public List<EducationDegree> getList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<EducationDegree> educationDegreeList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_EDUCATION_DEGREE);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int education_degree_id = resultSet.getInt("education_degree_id");
                    String education_degree_name = resultSet.getString("education_degree_name");

                    EducationDegree educationDegree = new EducationDegree(education_degree_id,education_degree_name);
                    educationDegreeList.add(educationDegree);
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
        return educationDegreeList;
    }
}