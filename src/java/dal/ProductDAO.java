/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dal.DBContext;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author xuanh
 */
public class ProductDAO extends DBContext {

    public Product checkid(int id) {
        String sql = "select * from Product where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("quantity"));
                p.setImgName(rs.getString("imgName"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                Category c = new Category();
                c.setId(rs.getInt("categoryID"));
                p.setCategory(c);
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Product checkName(String name) {
        String sql = "select * from Product where name like ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("quantity"));
                p.setImgName(rs.getString("imgName"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("status"));
                Category c = new Category();
                c.setId(rs.getInt("categoryID"));
                p.setCategory(c);
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int addProduct(Product c, int id, String name) {
        int n = 0;
        try {

            String sql = "insert into Product(id, name, price,quantity,imgName,description,categoryId,status) values (?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, name);
            if (checkName(name) != null) {
                System.out.println("The Product Name existed! Please try again");
            } else if (checkid(id) != null) {
                System.out.println("the Product id existed! Please try again");
            } else {
                stm.setInt(1, id);
                stm.setString(2, name);
                stm.setDouble(3, c.getPrice());
                stm.setInt(4, c.getQuantity());
                stm.setString(5, c.getImgName());
                stm.setString(6, c.getDescription());
                stm.setInt(7, c.getCategory().getId());
                stm.setInt(8, c.getStatus());
                n = stm.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int UpdateProduct(Product c) {
        int n = 0;
        try {

            String sql = "Update Product set name=?,price=?,quantity=?,imgName=?,description=?,status=?, categoryID=? where id=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getName());
            stm.setInt(3, c.getQuantity());
            stm.setDouble(2, c.getPrice());
            stm.setString(4, c.getImgName());
            stm.setString(5, c.getDescription());
            stm.setInt(6, c.getStatus());
            stm.setInt(7, c.getCategory().getId());
            stm.setInt(8, c.getId());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int UpdateProductQuantity(Product c) {
        int n = 0;
        try {

            String sql = "Update Product set quantity=? where id=?";

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, c.getQuantity());

            stm.setInt(2, c.getId());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    

    public Product DisplayAProduct(int id) {
        try {
            Product p = new Product();
            String sql = "select p.id as pid,p.name as pname,price,quantity"
                    + ",imgName,description, p.status as pstatus , c.status as cstatus,c.name as cateName, c.id as cid "
                    + "from product p inner join category c on p.categoryId = c.id where p.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImgName(rs.getString("imgName"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("pstatus"));
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cateName"));
                c.setStatus(rs.getInt("cstatus"));
                p.setCategory(c);
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getone(int id) {
        try {
            Product p = new Product();
            String sql = "select p.id as pid,p.name as pname,price,quantity"
                    + ",imgName,description, p.status as pstatus ,c.name as cateName, c.id as cid "
                    + "from product p inner join category c on p.categoryId = c.id where p.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImgName(rs.getString("imgName"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("pstatus"));
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cateName"));

                p.setCategory(c);
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> DisplayProductByCateid(int cate) {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "select p.id as pid,p.name as pname,price,quantity\n"
                    + ",imgName,description, p.status as pstatus , c.status as cstatus,c.name as cateName, c.id as cid\n"
                    + "from Product p inner join Category c\n"
                    + "on p.categoryId = c.id\n"
                    + "where c.id = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            stm.setInt(1, cate);
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImgName(rs.getString("imgName"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("pstatus"));
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cateName"));
                c.setStatus(rs.getInt("cstatus"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> DisplayAllProductandCateName() {
        List<Product> list = new ArrayList<>();

        try {
            String sql = "select p.id as pid,p.name as pname,price,quantity"
                    + ",imgName,description, p.status as pstatus , c.status as cstatus,c.name as cateName, c.id as cid\n"
                    + "from Product p inner join Category c \n"
                    + "on p.categoryId = c.id\n";

            PreparedStatement stm = connection.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImgName(rs.getString("imgName"));
                p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("pstatus"));
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cateName"));
                c.setStatus(rs.getInt("cstatus"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> DisplayProductOverview(String id) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select top ( 8 )p.id as pid,p.name as pname,price,quantity"
                    + ",imgName,description, p.status as pstatus , c.status as cstatus,c.name as cateName, c.id as cid\n"
                    + "from Product p inner join Category c \n"
                    + "on p.categoryId = c.id\n"
                    + "where c.id = ?";

            PreparedStatement stm = connection.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("pname"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setImgName(rs.getString("imgName"));
                // p.setDescription(rs.getString("description"));
                p.setStatus(rs.getInt("pstatus"));
                Category c = new Category();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cateName"));
                c.setStatus(rs.getInt("cstatus"));
                p.setCategory(c);
                list.add(p);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int DeleteProductbyPid(int id) {
        int n = 0;
        try {

            String sql = "  update Product set status = 0\n"
                    + "  where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Product ProductStatus(int status) {
        String sql = " select count(id) as counta from Product where status = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, status);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setCount(rs.getInt("counta"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO pd = new ProductDAO();
        OrderDetailDAO od = new OrderDetailDAO();

    }

}
