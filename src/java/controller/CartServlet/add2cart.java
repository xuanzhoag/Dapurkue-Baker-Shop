/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CartServlet;

import dal.OrderDetailDAO;
import dal.ProductDAO;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrderDetail;

/**
 *
 * @author xuanh
 */
public class add2cart extends HttpServlet {

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
//  
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        List<OrderDetail> lsCart = (List<OrderDetail>) session.getAttribute("listCart");

        try {
            if (lsCart == null) {
                //chua ton tai gio hang
                lsCart = new ArrayList<>();
                OrderDetail od = new OrderDetailDAO().getOne(id);

                od.setQuantity(1);
                lsCart.add(od);

            } else {
                //da ton tai gio hang
                boolean check = true;
                for (OrderDetail cart : lsCart) {
                    if (cart.getProductid().getId() == id) {
                        cart.setQuantity(cart.getQuantity() + 1);
                        check = false;
                        break;
                    }

                }

                if (check) {

                    OrderDetail od = new OrderDetailDAO().getOne(id);
                    od.setQuantity(1);

                    lsCart.add(od);
                }

            }

            //tinh tong TIEN trong gio hang
            double totalmoney = 0;
            int totalProduct = 0;
            for (OrderDetail cart : lsCart) {
                totalmoney += cart.getQuantity() * cart.getProductid().getPrice();
                totalProduct += cart.getQuantity();

            }

            session.setAttribute("grandtotal", totalmoney);
            session.setAttribute("totalProduct", totalProduct);
            session.setAttribute("listCart", lsCart);
            response.sendRedirect("ProductOverviewController");
            
        } catch (NumberFormatException ex) {
            response.getWriter().print(ex);
        }

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
