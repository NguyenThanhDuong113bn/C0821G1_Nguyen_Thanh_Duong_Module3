package model.service;

import model.been.User;
import model.repository.UserRepository;
import model.repository.UserRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = (UserRepository) new UserRepositoryImpl();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        userRepository.deleteUser(id);
    }

    @Override
    public void updateUser(User user) throws SQLException {
        userRepository.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String name) throws SQLException {
        return userRepository.findByCountry(name);
    }

    @Override
    public List<User> sortByName() throws SQLException {
        return userRepository.sortByName();
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userRepository.addUserTransaction(user, permision);
    }
}