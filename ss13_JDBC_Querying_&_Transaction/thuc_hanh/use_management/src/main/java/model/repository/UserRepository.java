package model.repository;

import model.been.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public void deleteUser(int id) throws SQLException;

    public void updateUser(User user) throws SQLException;

    public List<User> findByCountry(String name) throws SQLException;

    public List<User> sortByName() throws SQLException;

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, int[] permision);

    public void insertUpdateWithoutTransaction();

    public void insertUpdateUseTransaction();
}
