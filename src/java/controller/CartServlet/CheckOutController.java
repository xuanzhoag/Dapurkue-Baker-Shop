/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.CartServlet;

import dal.CustomerDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author xuanh
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        // get Customer information
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user1");
        if (a != null) {
            Customer cu = new CustomerDAO().getOne(a.getAccount());
            request.setAttribute("customer", cu);
            request.getRequestDispatcher("Checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
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
        HttpSession session = request.getSession();
        List<OrderDetail> lsCart = (List<OrderDetail>) session.getAttribute("listCart");
        OrderDetailDAO oddb = new OrderDetailDAO();
        double grandtotal = (double) session.getAttribute("grandtotal");
        Order or = new OrderDAO().getMaxID();
        Date utildate = new Date();
        java.sql.Date sqldate = new java.sql.Date(utildate.getTime());

        // get Customer information
        Account a = (Account) session.getAttribute("user1");
        Customer cu = new CustomerDAO().getOne(a.getAccount());
        // if username has not inputed the contact

        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String OrderName = request.getParameter("Receiver");
        if(OrderName.length() == 0){
            OrderName = cu.getCname();
        }
   
        // if user doesn't setting his/her contact, update customer information but not change customername
        if(cu.getCphone() == null || cu.getcAddress() == null){
         new CustomerDAO().UpdateCustomer1(cu.getId(), new Customer(phone, address));
        }
        // if the user has not login to take the services, send to login
        if (a.getAccount() != null) {

            //add to order
            Order o = new Order(or.getId() + 1, OrderName, phone,
                    address, grandtotal, 0, new Customer(cu.getId()), sqldate.toString());

            OrderDAO orderdb = new OrderDAO();
            orderdb.add(o);

            //add to orderDetail
            for (OrderDetail cart : lsCart) {

                OrderDetail c = new OrderDetail();

                o.setId(or.getId() + 1);
                c.setOrderid(o);
                Product p = new Product();

                p.setId(cart.getProductid().getId());
                Product pro1 = new ProductDAO().DisplayAProduct(cart.getProductid().getId());
                new ProductDAO().UpdateProductQuantity(new Product(cart.getProductid().getId(), pro1.getQuantity() - cart.getQuantity()));

             
                c.setProductid(p);
                c.setPrice(cart.getPrice());
                c.setQuantity(cart.getQuantity());
                c.setTotal(cart.getPrice() * cart.getQuantity());

                oddb.add(c);

            }

            session.removeAttribute("grandtotal");
            session.removeAttribute("listCart");
            response.sendRedirect("export");

        } else {
            response.sendRedirect("login");
        }
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
