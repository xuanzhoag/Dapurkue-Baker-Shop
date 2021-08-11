/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CartServlet;

import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.OrderDetail;

/**
 *
 * @author xuanh
 */
@WebServlet(name = "export", urlPatterns = {"/export"})
public class export extends HttpServlet {

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
        
       OrderDetailDAO o = new OrderDetailDAO();
        OrderDAO order = new OrderDAO();

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user1");        
        int maxoid = o.getMaxOidByUserName(a.getAccount()).getMaxOrdid();
        String maxoid2 = String.valueOf(maxoid);

     

        List<OrderDetail> list = o.getDetail(maxoid2);
           double sum = o.getSUM(maxoid2).getSumtotal();
//        
        int TotalQuantity = o.getTotalQuantity(maxoid2).getCount();
//        
       request.setAttribute("totalQuantity", TotalQuantity);
       request.setAttribute("contact", order.getOnebyoid(maxoid) );
//        
request.setAttribute("maxoid", maxoid);
        request.setAttribute("sum", sum);
        request.setAttribute("detail", list);
        
        
        
        request.getRequestDispatcher("ExportBill.jsp").forward(request, response);
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
        processRequest(request, response);
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
