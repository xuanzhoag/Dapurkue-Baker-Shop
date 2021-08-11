/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Order;
import model.Product;

/**
 *
 * @author xuanh
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> getAll() {
        String sql = "select o.*,c.cname\n"
                + "from [order] o inner join Customer c on o.cusID = c.id";
        ArrayList<Order> ls = new ArrayList<>();

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order c = new Order();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setMobile(rs.getString("mobile"));
                c.setAddress(rs.getString("address"));
                c.setMoney(rs.getDouble("totalPrice"));
                c.setStatus(rs.getInt("status"));
                Customer cus = new Customer();
                cus.setId(rs.getString("cusID"));
                cus.setCname(rs.getString("cname"));
                c.setCusID(cus);

                ls.add(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public int add(Order o) {
        int n = 0;
        try {

            String sql = "insert into [order] (id,name,mobile,address,dateCreate,status,totalprice,cusID) values(?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setInt(1, o.getId());
            stm.setString(2, o.getName());
            stm.setString(3, o.getMobile());
            stm.setString(4, o.getAddress());
            stm.setString(5, o.getDate());
            stm.setInt(6, o.getStatus());
            stm.setDouble(7, o.getMoney());
            stm.setString(8, o.getCusID().getId());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int DeleteOrderbyid(int id) {
        int n = 0;
        try {

            String sql = "Update [order] set [status] = -1  where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
     public int DeleteOrderbyid2(int id) {
        int n = 0;
        try {

            String sql = "delete from [order]  where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Order getOne(int cid) {

        String sql = "select o.*,c.cname  from [order] o inner join Customer c on o.cusID = c.id ";
        Order c = new Order();
        if (cid > 0) {
            sql += "WHERE c.id = ?";
        }
        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, cid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setMobile(rs.getString(3));
                c.setAddress(rs.getString(4));
                c.setMoney(rs.getDouble(5));
                c.setStatus(rs.getInt(6));
                Customer cus = new Customer();
                cus.setId(rs.getString(8));
                cus.setCname(rs.getString(9));
                c.setCusID(cus);
            }
        } catch (SQLException ex) {

        }

        return c;

    }

    public Order getOnebyoid(int oid) {

        String sql = "select o.*,c.cname from [order] o inner join Customer c on o.cusID = c.id ";
        Order c = new Order();
        if (oid > 0) {
            sql += "WHERE o.id = ?";
        }
        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, oid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setMobile(rs.getString(3));
                c.setAddress(rs.getString(4));
                c.setMoney(rs.getDouble(5));
                c.setStatus(rs.getInt(6));
                Customer cus = new Customer();
                cus.setId(rs.getString(8));
                cus.setCname(rs.getString(9));
                c.setCusID(cus);
            }
        } catch (SQLException ex) {

        }

        return c;

    }
    
    public List<Order> getAllbycid(int cid) {
        ArrayList<Order> ls = new ArrayList<>();
        String sql = "select o.*,c.cname from [order] o inner join Customer c on o.cusID = c.id ";
        Order c = new Order();
        if (cid > 0) {
            sql += "WHERE c.id = ?";
        }
        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, cid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setMobile(rs.getString(3));
                c.setAddress(rs.getString(4));
                c.setMoney(rs.getDouble(5));
                c.setStatus(rs.getInt(6));
                Customer cus = new Customer();
                cus.setId(rs.getString(8));
                cus.setCname(rs.getString(9));
               
                c.setCusID(cus);
                ls.add(c);
            }
        } catch (SQLException ex) {

        }

        return ls;

    }

    public Order getMaxID() {

        String sql = "select id  FROM [Project].[dbo].[ORDER]\n"
                + "  order by id desc";
        Order c = new Order();

        try (
                PreparedStatement stm = connection.prepareStatement(sql)) {

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c.setId(rs.getInt("id"));
            }
        } catch (SQLException ex) {

        }

        return c;

    }

    public Order OrderStatus(int status) {
        String sql = " select count(id) as counta from [Order] where status = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order p = new Order();
                p.setSum(rs.getInt("counta"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int update(Order o, int id) {
        int n = 0;
        try {

            String sql = " Update [order] set [name] = ?,[mobile] = ?,[address] = ? ,[totalPrice] = ?,[status] = ? ,[cusID] = ? ";
            if (id > 0) {
                sql += "where id = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(7, id);
            stm.setString(1, o.getName());
            stm.setString(2, o.getMobile());
            stm.setString(3, o.getAddress());
            stm.setDouble(4, o.getMoney());
            stm.setInt(5, o.getStatus());
            stm.setString(6, o.getCusID().getId());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updatestatus(Order o, int id) {
        int n = 0;
        try {

            String sql = " Update [order] set [status] = ? ";
            if (id > 0) {
                sql += "where id = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, o.getStatus());
            stm.setInt(2, id);

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updatestatus3(Order o) {
        int n = 0;
        try {

            String sql = " Update [order] set [status] = ? where id = ?";
         
           
            
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, o.getStatus());
            stm.setInt(2, o.getId());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        Order or = new OrderDAO().getMaxID();
//        Customer cu = new CustomerDAO().getOne("hoang");
//        System.out.println(o.add(new Order(or.getId() + 1, cu.getCname(), cu.getCphone(),
//                cu.getcAddress(), 2.0, 1, new Customer(cu.getId()), "")));
        OrderDetailDAO ord = new OrderDetailDAO();
        Order od = new Order();
        od.setStatus(1);
        System.out.println(o.getAllbycid(7));
    }
}
