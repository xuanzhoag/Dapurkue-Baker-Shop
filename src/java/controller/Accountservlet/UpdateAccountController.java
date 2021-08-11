/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Accountservlet;

import dal.AccountDAO;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;

/**
 *
 * @author xuanh
 */
@WebServlet(name = "UpdateAccountController", urlPatterns = {"/UpdateAccountController"})
public class UpdateAccountController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_id = request.getParameter("id");

        int id = Integer.parseInt(raw_id);
        AccountDAO adb = new AccountDAO();
        Account a = adb.getAnAccount(id);
        CustomerDAO c = new CustomerDAO();
        Customer c2 = c.getOne(adb.getAnAccount(id).getAccount());

        request.setAttribute("accountone", a);
        request.setAttribute("customer", c2);
        request.getRequestDispatcher("view/Account/update.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("user");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        String cname = request.getParameter("cname");
        String cphone = request.getParameter("cphone");
        String cAdress = request.getParameter("cAddress");

        AccountDAO adb = new AccountDAO();
        CustomerDAO cdb = new CustomerDAO();

//        adb.UpdateAccount(new Account(username, password), id);
        if (newpassword.length() == 0) {
            newpassword = password;
        }
        Customer c = new Customer();
        c.setCname(cname);
        c.setCphone(cphone);
        c.setcAddress(cAdress);
        c.setUsername(username);
        c.setPassword(newpassword);
        int a = adb.changePassword(username, password, newpassword, id);
        int b = cdb.UpdateCustomer2(username, password, newpassword, c);
        response.sendRedirect("UpdateAccountController");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
