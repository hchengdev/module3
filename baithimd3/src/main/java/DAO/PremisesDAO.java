package DAO;

import model.Premises;


import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PremisesDAO implements IPremisesDAO {

    protected Connection getConnection() {
        String jdbcURL = "jdbc:mysql://localhost:3306/Premises";
        String jdbcUsername = "root";
        String jdbcPassword = "12345@abc";
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    private Premises makePremisesFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String premisesCode = resultSet.getString("premises_code");
        String status = resultSet.getString("status");
        BigDecimal area = resultSet.getBigDecimal("area");
        int floor = resultSet.getInt("floor");
        String type = resultSet.getString("type");
        BigDecimal price = resultSet.getBigDecimal("price");
        Date startDate = resultSet.getDate("start_date");
        Date endDate = resultSet.getDate("end_date");
        return new Premises(premisesCode, status, area, floor, type, price, startDate, endDate);

    }

    @Override
    public Premises getPremisesById(int id) throws SQLException {
        String query = "SELECT * FROM Premises WHERE id = ?";

        try (Connection connection = getConnection(); ) {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return makePremisesFromResultSet(resultSet);
            }
        }
        return null;
    }

    @Override
    public void insertPremises(Premises premises) throws SQLException {
        String query = "INSERT INTO Premises (premises_code, status, area, floor, type, price, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query);) {
            preparedStatement.setString(1, premises.getPremisesCode());
            preparedStatement.setString(2, premises.getStatus());
            preparedStatement.setBigDecimal(3, premises.getArea());
            preparedStatement.setInt(4, premises.getFloor());
            preparedStatement.setString(5, premises.getType());
            preparedStatement.setBigDecimal(6, premises.getPrice());
            preparedStatement.setDate(7, new Date(premises.getStartDate().getTime()));
            preparedStatement.setDate(8, new Date(premises.getEndDate().getTime()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public boolean updatePremises(int id, Premises premises) throws SQLException {
        String query = "UPDATE Premises SET premises_code = ?, status = ?, area = ?, floor = ?, type = ?, price = ?, start_date = ?, end_date = ? WHERE id = ?";

        try (Connection connection = getConnection()) {
             PreparedStatement statement = connection.prepareStatement(query);

            statement.setString(1, premises.getPremisesCode());
            statement.setString(2, premises.getStatus());
            statement.setBigDecimal(3, premises.getArea());
            statement.setInt(4, premises.getFloor());
            statement.setString(5, premises.getType());
            statement.setBigDecimal(6, premises.getPrice());
            statement.setDate(7, new Date(premises.getStartDate().getTime()));
            statement.setDate(8, new Date(premises.getEndDate().getTime()));
            statement.setInt(9, id);

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0; // Return true if at least one row is updated
        } catch (SQLException e){
                e.printStackTrace();
                return false;
            }
        }

    @Override
    public boolean deletePremises(Premises premises) throws SQLException {
        String query = "DELETE FROM Premises WHERE id =?";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, premises.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public List<Premises> getAllPremises() {
        String query = "SELECT * FROM Premises";
        List<Premises> premisesList = new ArrayList<>();
        try (Connection connection =getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Premises premises = makePremisesFromResultSet(resultSet);
                premisesList.add(premises);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return premisesList;
    }

    public List<Premises> getPremisesByType(String type) {
        String query = "SELECT * FROM Premises WHERE type = ?";
        List<Premises> premisesList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, type);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Premises premises = makePremisesFromResultSet(resultSet);
                    premisesList.add(premises);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return premisesList;
    }

    public List<Premises> getPremisesByPrice(BigDecimal minPrice, BigDecimal maxPrice) {
        String query = "SELECT * FROM Premises WHERE price BETWEEN ? AND ?";
        List<Premises> premisesList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setBigDecimal(1, minPrice);
            statement.setBigDecimal(2, maxPrice);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Premises premises = makePremisesFromResultSet(resultSet);
                    premisesList.add(premises);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return premisesList;
    }

    public List<Premises> getPremisesByFloor(int floor) {
        String query = "SELECT * FROM Premises WHERE floor = ?";
        List<Premises> premisesList = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, floor);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Premises premises = makePremisesFromResultSet(resultSet);
                    premisesList.add(premises);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return premisesList;
    }
}
