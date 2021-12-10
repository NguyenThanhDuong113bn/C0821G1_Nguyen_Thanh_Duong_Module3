package model.reposiory.Implement;

import model.been.ServiceType;
import model.reposiory.DBConnection;
import model.reposiory.IServiceTypeRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRespositoryImpl implements IServiceTypeRespository {
    private static final String  SELECT_SERVICE_TYPE = "select * from service_type";
    @Override
    public List<ServiceType> getList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<ServiceType> serviceTypeList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_SERVICE_TYPE);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("service_type_id");
                    String name = resultSet.getString("service_type_name");
                    ServiceType serviceType = new ServiceType(id,name);
                    serviceTypeList.add(serviceType);
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
        return serviceTypeList;

    }

}