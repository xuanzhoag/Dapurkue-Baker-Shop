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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Customer;

import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author xuanh
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getAll() {
        String sql = "select od.*, o.name as ordername, p.name as productname\n"
                + "from OrderDetail od inner join [Order] o on od.OrderId = o.id\n"
                + "inner join Product p on od.ProductID = p.id";
        List<OrderDetail> ls = new ArrayList<>();

        try {
            PreparedStatement stm = connection.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail c = new OrderDetail();
                c.setId(rs.getString("id"));
                Order o = new Order();
                o.setId(rs.getInt("OrderId"));
                o.setName(rs.getString("ordername"));
                c.setOrderid(o);
                Product p = new Product();
                p.setId(rs.getInt("productid"));
                p.setName(rs.getString("productname"));
                c.setProductid(p);
                c.setPrice(rs.getDouble("price"));
                c.setTotal(rs.getDouble("total"));
                c.setQuantity(rs.getInt("quantity"));
                c.setSize(rs.getDouble("size"));
                ls.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public OrderDetail getOne(int id) {

        String query = "select od.*, o.name as ordername, p.name as productname,p.imgName,p.price as Pprice,p.categoryid,c.name as catename\n"
                + " from OrderDetail od inner join [Order] o on od.OrderId = o.id\n"
                + " inner join Product p on od.ProductID = p.id \n"
                + " inner join Category c on c.id = p.categoryId\n"
                + "  where p.id =?";

        OrderDetail c = new OrderDetail();
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setId(rs.getString("id"));
                Order o = new Order();
                o.setId(rs.getInt("OrderId"));
                o.setName(rs.getString("ordername"));
                c.setOrderid(o);
                Product p = new Product();
                p.setId(rs.getInt("productid"));
                p.setName(rs.getString("productname"));
                p.setImgName(rs.getString("imgName"));
                p.setPrice(rs.getDouble("Pprice"));
                Category z = new Category();
                z.setId(rs.getInt("categoryid"));
                z.setName(rs.getString("catename"));
                p.setCategory(z);
                c.setProductid(p);
                c.setPrice(rs.getDouble("price"));
                c.setTotal(rs.getDouble("total"));
                c.setQuantity(rs.getInt("quantity"));

                return c;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;

    }

    public int add(OrderDetail a) {
        int n = 0;

        try {

            String sql = "insert into OrderDetail (OrderId,ProductID,quantity,Price,Total) values(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, a.getOrderid().getId());
            stm.setInt(2, a.getProductid().getId());
            stm.setInt(3, a.getQuantity());
            stm.setDouble(4, a.getPrice());
            stm.setDouble(5, a.getTotal());
            n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public OrderDetail getSUM(String id) {

        String query = "select SUM(Total) as sum\n"
                + "from OrderDetail\n"
                + "where OrderId =?";

        OrderDetail c = new OrderDetail();
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setSumtotal(rs.getDouble("sum"));
                return c;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;

    }

    public OrderDetail getTotalQuantity(String id) {

        String query = "select count(quantity) as counta\n"
                + "from OrderDetail\n"
                + "where OrderId =?";

        OrderDetail c = new OrderDetail();
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setCount(rs.getInt("counta"));
                return c;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;

    }

     public OrderDetail getCancelQuantity(String id) {

        String query = "select sum(quantity) as suma\n"
                + "from OrderDetail\n"
                + "where OrderId =?";

        OrderDetail c = new OrderDetail();
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setCount(rs.getInt("suma"));
                return c;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;

    }
    public int update(OrderDetail o, String id) {
        int n = 0;
        try {

            String sql = " update orderdetail set orderid = ?\n"
                    + "      ,[ProductID] = ?\n"
                    + "      ,[Total]= ?\n"
                    + "      ,[Price]= ?\n"
                    + "      ,[quantity]= ? ";
            if (id.length() > 0) {
                sql += "where id = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(6, id);
            stm.setInt(1, o.getOrderid().getId());
            stm.setInt(2, o.getProductid().getId());
            stm.setDouble(3, o.getTotal());
            stm.setDouble(4, o.getPrice());
            stm.setInt(5, o.getQuantity());

            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int DeletebyPid(int id) {
        int n = 0;
        try {

            String sql = "delete from orderDetail where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public OrderDetail getMaxOidByUserName(String username) {

        String query = "select  max(o.id) as maxordid \n"
                + "from [order] o inner join Customer c\n"
                + "on o.cusID = c.id\n"
                + "where c.username = ? ";

        OrderDetail c = new OrderDetail();
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c.setMaxOrdid(rs.getInt("maxordid"));
                return c;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;

    }

    public List<OrderDetail> getDetail(String id) {
        String sql = "select od.*, o.name as ordername, p.name as productname, P.imgName,c.name as catename\n"
                + "from OrderDetail od inner join [Order] o on od.OrderId = o.id\n"
                + "inner join Product p on od.ProductID = p.id \n"
                + "inner join Category c on p.categoryId = c.id\n"
                + "where o.id = ?";

        List<OrderDetail> ls = new ArrayList<>();

        try {

            PreparedStatement stm = connection.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail c = new OrderDetail();
                c.setId(rs.getString("id"));
                Order o = new Order();
                o.setId(rs.getInt("OrderId"));
                o.setName(rs.getString("ordername"));
                c.setOrderid(o);
                Product p = new Product();
                p.setId(rs.getInt("productid"));
                p.setName(rs.getString("productname"));
                Category ca = new Category();
                ca.setName(rs.getString("catename"));
                p.setCategory(ca);
                p.setImgName(rs.getString("imgName"));
                c.setProductid(p);
                c.setPrice(rs.getDouble("price"));
                c.setTotal(rs.getDouble("total"));
                c.setQuantity(rs.getInt("quantity"));
                ls.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }

    public static void main(String[] args) {
        OrderDetailDAO c = new OrderDetailDAO();
        String id = String.valueOf(c.getMaxOidByUserName("hoang").getMaxOrdid());
        System.out.println(c.getOne(1).getProductid().getId());
    }
}
