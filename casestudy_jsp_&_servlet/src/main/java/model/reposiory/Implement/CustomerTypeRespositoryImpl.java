package model.reposiory.Implement;


import model.been.CustomerType;
import model.reposiory.DBConnection;
import model.reposiory.ICustomerTypeRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRespositoryImpl implements ICustomerTypeRespository {
    private static final String  SELECT_CUSTOMER_TYPE = "select * from customer_type";
    @Override
    public List<CustomerType> getList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<CustomerType> customerTypeList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_type_name");
                    CustomerType customerType = new CustomerType(id,name);
                    customerTypeList.add(customerType);
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
        return customerTypeList;

    }
}