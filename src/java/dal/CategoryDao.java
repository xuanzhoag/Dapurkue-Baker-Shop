/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author AnhDT
 */
public class CategoryDao extends DBContext {

    public List<Category> getAll() {

        String query = "SELECT * FROM category";
        List<Category> ls = new ArrayList<>();

        try (
                PreparedStatement ps = connection.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3));
                ls.add(category);
            }
            return ls;
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }
//NEED TO EDIT

    public Category getOne(int id) {

        String query = "SELECT * FROM category WHERE id = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category p = new Category();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setStatus(rs.getInt("status"));
                return p;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;

    }

        public int UpdateCategory(Category c, int id) {
            int n = 0;
            try {

                String sql = "update Category set name = ?, status = ? where id = ?";

                PreparedStatement stm = connection.prepareStatement(sql);

                stm.setInt(3, id);
                stm.setString(1, c.getName());
                stm.setInt(2, c.getStatus());

                n = stm.executeUpdate();

            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            return n;
        }

    public int add(Category c, String name) {
        int n = 0;
        try {
            if (checkCate(name) != null) {
                System.out.println("Category existed");
            } else {

                String sql = "INSERT INTO category(name,status)"
                        + " VALUES(?, ?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, name);
                stm.setInt(2, c.getStatus());
                n = stm.executeUpdate();

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(int cid) {
        int n = 0;
        String preSql = "update category set status= 0 where id=?";

        try {
            PreparedStatement pre = connection.prepareStatement(preSql);

            pre.setInt(1, cid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Category checkCate(String name) {
        String sql = "select * from Category where name=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDao().getAll());
    }

//      public Category getOne(int id) {
//        
//        String query = "SELECT * FROM categories WHERE id = ?";
//        
//        try (Connection con = SQLServerConnection.getConnection();
//                PreparedStatement ps = con.prepareStatement(query)) {
//            ps.setInt(1, id);
//            
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                Category p = Category.builder()
//                        .id(rs.getInt(1))
//                        .name(rs.getString(2))
//                        .status(rs.getInt(3))
//                        .build();
//                return p;
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace(System.out);
//        }
//        return null;
//    }
}
