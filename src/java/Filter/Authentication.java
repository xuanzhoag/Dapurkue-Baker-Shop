/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author xuanh
 */
@WebFilter(filterName = "Authentication", urlPatterns = {"/Administrator", "/ProductManager", "/RemoveProductController","/OrderManager",
    "/InsertProductController","/InsertCustomerController","/UpdateCustomerController","/RemoveCustomerController",
    "/UpdateCategoryController","/RemoveCategoryController","/InsertCategoryController","/RemoveAccountController"

})
public class Authentication implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpServletResponse response1 = (HttpServletResponse) response;
        HttpSession session = request1.getSession();
        Account a = (Account) session.getAttribute("user1");
        if(a.getRole().equalsIgnoreCase("admin")){
            chain.doFilter(request, response);
        }else {
            response1.sendRedirect("index.jsp");
            
            }

    }

    @Override
    public void destroy() {
    }

}
