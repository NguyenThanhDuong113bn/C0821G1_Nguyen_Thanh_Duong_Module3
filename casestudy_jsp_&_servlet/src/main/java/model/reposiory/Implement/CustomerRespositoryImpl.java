package model.reposiory.Implement;

import model.been.Customer;
import model.reposiory.DBConnection;
import model.reposiory.ICustomerRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRespositoryImpl implements ICustomerRespository {
    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customer";
    private static final String INSERT_NEW_CUSTOMER = "INSERT INTO customer ( customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) VALUES (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM customer WHERE customer_id = ?";
    private static final String DELETE_CUSTOMER_BY_ID = "DELETE FROM customer WHERE customer_id = ?; ";
    private static final String SELECT_CUSTOMER = "SELECT*FROM customer " +
            "where customer_id=?;";
    private static final String UPDATE_CUSTOMER = " update customer \n" +
            "  set customer_type_id=?, customer_name = ? , customer_birthday=?,\n" +
            "  customer_gender=?,customer_id_card=?,customer_phone=?,\n" +
            "  customer_email=?,customer_address=?" +
            "  where customer_id = ? ;";


    @Override
    public List<Customer> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerList.add(customer);
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
        return customerList;
    }

    @Override
    public void save(Customer customer) {

    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public boolean remove(int id) {
        return false;
    }

    @Override
    public Customer getCustomerById(int id) {
        return null;
    }

    @Override
    public void updateCustomer(Customer customer) {

    }

    @Override
    public List<Customer> search(int id) {
        return null;
    }
}