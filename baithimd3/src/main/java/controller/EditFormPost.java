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
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(value = "/edit-premises")
public class EditFormPost extends HttpServlet {
    IPremisesDAO premisesDAO = new PremisesDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String premisesCode = request.getParameter("premises_code");
        String status = request.getParameter("status");
        BigDecimal area = new BigDecimal(request.getParameter("area"));
        int floor = Integer.parseInt(request.getParameter("floor"));
        String type = request.getParameter("type");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        Date startDate = Date.valueOf(request.getParameter("start_date"));
        Date endDate = Date.valueOf(request.getParameter("end_date"));
        Premises premises = new Premises( premisesCode, status, area, floor, type, price, startDate, endDate);
        try {
            premisesDAO.updatePremises(id, premises);

            request.setAttribute("message", "Success");

            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");

            dispatcher.forward(request, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

