/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dal.AccountDAO;
import dal.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customer;
import model.Product;

/**
 *
 * @author xuanh
 */
public class CustomerDAO extends DBContext {

    public int UpdateCustomer(String id, String oldpass, String newpass, String username, Customer c) {

        int n = 0;
        int x = 0;
        try {

            if (Checkuser(username, oldpass) == null) {
                System.out.println("Account does not exist!");

            } else {

                try {
                    // check OK
                    String Checksql = "update [customer] set password=? where id=?";
                    PreparedStatement stm1 = connection.prepareStatement(Checksql);
                    stm1.setString(1, newpass);
                    stm1.setString(2, id);
                    x = stm1.executeUpdate();

                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            String sql = "update Customer set "
                    + "cname=?,cphone=?,cAddress=?,username=?,status=? "
                    + "where id=? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getCname());
            stm.setString(2, c.getCphone());
            stm.setString(3, c.getcAddress());
            stm.setString(4, c.getUsername());

            stm.setInt(5, c.getStatus());
            stm.setString(6, id);
            n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x + n;
    }

    public int UpdateCustomer1(String cid, Customer c) {
        int n = 0;
        try {
            String sql = "update Customer set "
                    + "cname=?,cphone=?,cAddress=? "
                    + "where id=? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getCname());
            stm.setString(2, c.getCphone());
            stm.setString(3, c.getcAddress());

            stm.setString(4, cid);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(int cid, int status) {
        int n = 0;
        String preSql = "update Customer set status=? where id=?";

        try {
            PreparedStatement pre = connection.prepareStatement(preSql);
            pre.setInt(1, status);
            pre.setInt(2, cid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public int changeStatus2(String username, int status) {
        int n = 0;
        String preSql = "update Customer set status=? where username=?";

        try {
            PreparedStatement pre = connection.prepareStatement(preSql);
            pre.setInt(1, status);
            pre.setString(2, username);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public List<Customer> getAll() {

        String query = "SELECT * FROM Customer";
        List<Customer> ls = new ArrayList<>();

        try (
                PreparedStatement ps = connection.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getInt(7));
                ls.add(c);

            }
            return ls;
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
//NEED TO EDIT

    public Customer getOne(int cid) {

        String sql = "SELECT * FROM Customer WHERE id = ?";
        Customer c = new Customer();
        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, cid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c = new Customer(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));

            }
        } catch (SQLException ex) {

        }

        return c;

    }

    public Customer getOne(String username) {

        String sql = "SELECT * FROM Customer WHERE username = ?";
        Customer c = new Customer();
        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, username);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c = new Customer(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));

            }
        } catch (SQLException ex) {

        }

        return c;

    }

    public Customer Checkacc(String username, String password) {

        String sql = "SELECT * FROM Customer WHERE username = ? and password = ?";

        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("id"));
                c.setCname(rs.getString("cname"));
                c.setCphone(rs.getString("cphone"));
                c.setcAddress(rs.getString("cAddress"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                return c;

            }
        } catch (SQLException ex) {

        }

        return null;

    }

    public Customer Checkusername(String username) {

        String sql = "SELECT * FROM Customer WHERE username = ? ";

        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, username);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("id"));
                c.setCname(rs.getString("cname"));
                c.setCphone(rs.getString("cphone"));
                c.setcAddress(rs.getString("cAddress"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                return c;

            }
        } catch (SQLException ex) {

        }

        return null;

    }

    public void findCustomerByName(String name) {

        try {
            String sql = "Select * from Customer where name like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                String cid = rs.getString(1);

                String cname = rs.getString(2);
                String cphone = rs.getString(3);
                String caddress = rs.getString(4);
                String username = rs.getString(5);
                String password = rs.getString(6);
                int status = rs.getInt(7);

                System.out.println(new Customer(cid, cname, cphone, caddress, username, password, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int DeleteCustomerbyid(int id) {
        int n = 0;
        try {

            String sql = "delete from Customer where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int add(Customer a, String username) {
        int n = 0;

        try {
            if (Checkusername(username) != null) {
                System.out.println("the username has been created before");
            } else {

                String sql = "insert into Customer (cname,cphone,cAddress,username,password,status) values(?,?,?,?,?,?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, a.getCname());
                stm.setString(2, a.getCphone());
                stm.setString(3, a.getcAddress());
                stm.setString(4, a.getUsername());
                stm.setString(5, a.getPassword());
                stm.setInt(6, a.getStatus());
                n = stm.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int changePassword(String username, String oldpass,
            String newPass, int id) {
        int n = 0;

        // check pass and repass -- javascript
        // check account (username, oldpass)
        try {
//            String checksql = "select * from [Account] where user='" + username + "'"
//                    + " and password='" + oldpass + "'";
//            ResultSet rs = this.getData(checksql);
//            if (!rs.next()) {
//                System.out.println("Account does not exist");
//                return 0;
//
//            }
            if (Checkuser(username, oldpass) == null) {
                System.out.println("Account does not exist!");

            } else {

                // check OK
                String sql = "update [customer] set password=? where id=?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, newPass);
                stm.setInt(2, id);
                n = stm.executeUpdate();
                return n;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // check OK
        return n;
    }

    public Customer Checkuser(String username, String password) {

        String sql = "SELECT * FROM Customer WHERE username = ? and password = ?";

        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getString("id"));
                c.setCname(rs.getString("cname"));
                c.setCphone(rs.getString("cphone"));
                c.setcAddress(rs.getString("cAddress"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                return c;

            }
        } catch (SQLException ex) {

        }

        return null;

    }

    public Customer CustomerStatus(int status) {
        String sql = " select count(id) as counta from Customer where status = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer p = new Customer();
                p.setCount(rs.getInt("counta"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int UpdateCustomer2( String username,String oldpass, String newpass, Customer c) {

        int n = 0;
        int x = 0;
        try {

            if (Checkuser(username, oldpass) == null) {
                System.out.println("Account does not exist!");

            } else {

                try {
                    // check OK
                    String Checksql = "update [customer] set password=? where username like ?";
                    PreparedStatement stm1 = connection.prepareStatement(Checksql);
                    stm1.setString(1, newpass);
                    stm1.setString(2, username);
                    x = stm1.executeUpdate();

                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            

            String sql = "update Customer set "
                    + "cname=?,cphone=?,cAddress=? "
                    + "where username=? ";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getCname());
            stm.setString(2, c.getCphone());
            stm.setString(3, c.getcAddress());
            stm.setString(4, c.getUsername());

            n = stm.executeUpdate();
}
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x + n;
    }

    public static void main(String[] args) {
        CustomerDAO cusDB = new CustomerDAO();
        Customer c = new Customer();
        c.setUsername("123aaass");
        System.out.println(cusDB.changeStatus2(c.getUsername(), 1));   
        
      
    }
}
