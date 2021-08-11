/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Administrator;

import dal.CustomerDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Order;
import model.Product;

/**
 *
 * @author xuanh
 */
@WebServlet(name = "Administrator", urlPatterns = {"/Administrator"})
public class Administrator extends HttpServlet {

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

        Product p1 = new ProductDAO().ProductStatus(1);
        Product p2 = new ProductDAO().ProductStatus(0);
        request.setAttribute("pactive", p1);
        request.setAttribute("pdeactive", p2);

        Customer c1 = new CustomerDAO().CustomerStatus(1);
        Customer c2 = new CustomerDAO().CustomerStatus(0);
        request.setAttribute("cuactive", c1);
        request.setAttribute("cudeactive", c2);

        Order o1 = new OrderDAO().OrderStatus(-1);
        Order o2 = new OrderDAO().OrderStatus(0);
        Order o3 = new OrderDAO().OrderStatus(1);
        request.setAttribute("ocancel", o1);
        request.setAttribute("oshipping", o2);
        request.setAttribute("ocomplete", o3);

        CustomerDAO cdb = new CustomerDAO();
        request.setAttribute("cusList", cdb.getAll());

        request.getRequestDispatcher("Admin/Administrator.jsp").forward(request, response);
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
        processRequest(request, response);

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
