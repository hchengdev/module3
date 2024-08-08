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
import java.util.List;

@WebServlet(value = "/list-premises")
public class ListFormGet extends HttpServlet {
    IPremisesDAO premisesDAO = new PremisesDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Premises> premises = premisesDAO.getAllPremises();
        req.setAttribute("premisesList", premises);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("premises/list.jsp");
        requestDispatcher.forward(req, resp);
    }
}
