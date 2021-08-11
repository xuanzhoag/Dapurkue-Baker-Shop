/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CartServlet;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author xuanh
 */
@WebServlet(name = "Reload", urlPatterns = {"/Reload"})
public class Reload extends HttpServlet {

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
        HttpSession session = request.getSession();
        List<OrderDetail> lsCart = (List<OrderDetail>) session.getAttribute("listCart");
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = new ProductDAO().getone(id);

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        for (OrderDetail cart : lsCart) {
            if (cart.getProductid().getId() == id) {
                if (quantity <= 0) {
                    cart.setQuantity(cart.getQuantity());
                } else if (quantity >= p.getQuantity()) {
                    cart.setQuantity(p.getQuantity());

                } else {
                    cart.setQuantity(quantity);
                }

            }
        }

        //tinh tong TIEN trong gio hang
        double totalmoney = 0;
        int totalProduct = 0;
        for (OrderDetail cart : lsCart) {
            totalmoney += cart.getQuantity() * cart.getProductid().getPrice();
            totalProduct += cart.getQuantity();

        }
        request.setAttribute("productQuantity", p.getQuantity());
        session.setAttribute("grandtotal", totalmoney);
        session.setAttribute("totalProduct", totalProduct);
        session.setAttribute("listCart", lsCart);
        response.sendRedirect("showCartController");

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
