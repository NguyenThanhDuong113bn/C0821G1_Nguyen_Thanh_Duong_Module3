package model.service.Impl;

import model.been.User;
import model.repository.Impl.UserRepositoryImpl;
import model.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    UserRepositoryImpl userRepository = new UserRepositoryImpl();
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
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> searchByCountry(String countrySearch) {
        return userRepository.searchByCountry(countrySearch);
    }

    @Override
    public List<User> sortByName(String sort) {
        return userRepository.sortByName(sort);
    }
}