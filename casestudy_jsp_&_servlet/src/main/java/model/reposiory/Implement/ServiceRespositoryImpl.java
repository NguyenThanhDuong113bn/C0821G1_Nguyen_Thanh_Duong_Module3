package model.reposiory.Implement;


import model.been.Service;
import model.reposiory.DBConnection;
import model.reposiory.IServiceRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRespositoryImpl implements IServiceRespository {


    private static final String SELECT_ALL_SERVICES = "SELECT * FROM service";
    private static final String INSERT_NEW_SERVICES = "INSERT INTO service (service_name, service_area, service_cost, " +
            "service_max_people, rent_type_id, service_type_id, standard_room, description_other_convenience, pool_area," +
            " number_of_floors) VALUES (?,?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Service> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Service> serviceList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICES);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("service_id");
                    String name_service = resultSet.getString("service_name");
                    int area_service = resultSet.getInt("service_area");
                    Double cost_service = resultSet.getDouble("service_cost");
                    int max_people_service = resultSet.getInt("service_max_people");
                    int type_id_rent = resultSet.getInt("rent_type_id");
                    int type_id_service = resultSet.getInt("service_type_id");
                    String standard_room = resultSet.getString("standard_room");
                    String description_other_convenience = resultSet.getString("description_other_convenience");
                    Double pool_area = resultSet.getDouble("pool_area");
                    int number_of_floors = resultSet.getInt("number_of_floors");

                    Service service = new Service(id, name_service, area_service, cost_service, max_people_service, type_id_rent,
                            type_id_service, standard_room, description_other_convenience,pool_area,number_of_floors);
                    serviceList.add(service);
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
        return serviceList;
    }

//    @Override
//    public Customer getServiceById(int id) {
//        return null;
//    }

    @Override
    public void save(Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        Service service1 = service;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_NEW_SERVICES);
                preparedStatement.setString(1, service.getService_name());
                preparedStatement.setInt(2, service.getService_area());
                preparedStatement.setDouble(3, service.getService_cost());
                preparedStatement.setInt(4, service.getService_max_people());
                preparedStatement.setInt(5, service.getRent_type_id());
                preparedStatement.setInt(6, service.getService_type_id());
                preparedStatement.setString(7, service.getStandard_room());
                preparedStatement.setString(8, service.getDescription());
                preparedStatement.setDouble(9, service.getPool_area());
                preparedStatement.setInt(10, service.getNumber_of_floors());
                preparedStatement.executeUpdate();

            } catch (SQLException e) {
                printSQLException(e);
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    private void printSQLException(SQLException e) {
    }
}