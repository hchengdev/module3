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
import java.util.Calendar;

import static javax.xml.bind.DatatypeConverter.parseDate;

@WebServlet(value ="/create-premises")
public class CreateFormPost extends HttpServlet {
    IPremisesDAO premisesDAO = new PremisesDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String premisesCode = request.getParameter("premisesCode");
        String status = request.getParameter("status");
        BigDecimal area = new BigDecimal(request.getParameter("area"));
        int floor = Integer.parseInt(request.getParameter("floor"));
        String type = request.getParameter("type");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        Premises premises = new Premises( premisesCode, status, area, floor, type, price, startDate, endDate);
        try {
            premisesDAO.insertPremises(premises);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("premises/create.jsp");
        dispatcher.forward(request, resp);
    }
}

