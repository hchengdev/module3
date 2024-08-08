package controller;

import DAO.IPremisesDAO;
import DAO.PremisesDAO;
import model.Premises;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(value = "/delete-premises-form")
public class DeleteFormGet  extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        IPremisesDAO premisesDAO = new PremisesDAO();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Premises premises = premisesDAO.getPremisesById(id);
            req.setAttribute("premises", premises);
            req.setAttribute("id", id);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("premises/delete.jsp");
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
