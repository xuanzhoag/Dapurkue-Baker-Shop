/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CustomerServlet;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import dal.CustomerDAO;

/**
 *
 * @author xuanh
 */
public class UpdateCustomerController extends HttpServlet {

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
        String id = request.getParameter("id");
        int cusid = 0;
        if (id.length() > 0) {
            cusid = Integer.parseInt(id);
        }
        request.setAttribute("customer", new CustomerDAO().getOne(cusid));
        request.getRequestDispatcher("view/Customer/update.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String name = request.getParameter("cname");
        String cphone = request.getParameter("cphone");
        String address = request.getParameter("cAddress");
        String username = request.getParameter("username");
        String oldpassword = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");
        int status = Integer.parseInt(request.getParameter("status"));
        CustomerDAO c = new CustomerDAO();
        if (newpassword.length() == 0) {
            newpassword = oldpassword;
        }

        c.UpdateCustomer(id, oldpassword, newpassword, username, new Customer(name, cphone, address, username, status));
        
        AccountDAO a = new AccountDAO();
        if (a.checkUsername(username) != null) {
            a.changePassword(username, oldpassword, newpassword, a.checkUsername(username).getId());
        }

        response.sendRedirect("Administrator");
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
