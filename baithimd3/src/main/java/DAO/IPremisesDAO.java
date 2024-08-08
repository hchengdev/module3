package DAO;

import model.Premises;

import java.sql.SQLException;
import java.util.List;

public interface IPremisesDAO {
    Premises getPremisesById(int id) throws SQLException;

    void insertPremises(Premises premises) throws SQLException;

    boolean updatePremises(int id, Premises premises) throws SQLException;

    boolean deletePremises(Premises premises) throws SQLException;

    List<Premises> getAllPremises();

}
