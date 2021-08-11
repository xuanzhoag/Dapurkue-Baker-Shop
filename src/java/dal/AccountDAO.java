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

import model.Account;
import model.Product;

/**
 *
 * @author xuanh
 */
public class AccountDAO extends DBContext {

    public Account checkLogin(String name, String password) {
        try {
            String sql = "select * from account where [user] like ? and password like ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setAccount(rs.getString("user"));
                a.setPassword(rs.getString("password"));
                a.setRole(rs.getString("role"));
                return a;

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }

    public List<Account> getAll() {
        Account aD = new Account();
        String query = "SELECT * FROM Account";
        List<Account> ls = new ArrayList<>();

        try (
                PreparedStatement ps = connection.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                aD = new Account(rs.getInt(1), rs.getString(2), rs.getString(3));
                ls.add(aD);
            }
            return ls;
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        return null;
    }

    public Account getAnAccount(int a) {
        Account aD = new Account();
        try {
            String sql = "SELECT * FROM Account WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            stm.setInt(1, a);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                aD = new Account(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aD;
    }

    public int add(Account account, String username) {
        int n = 0;
        try {
            if(checkUsername(username) != null){
                System.out.println("Account existed");
            }else{
                
           
            
            
            String sql = "INSERT INTO account([user],password,role)"
                    + " VALUES(?, ?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, account.getPassword());
            stm.setString(3,account.getRole());
            n = stm.executeUpdate();
            
             }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int UpdateAccount(Account c, int id) {
        int n = 0;
        try {

            String sql = "Update account SET [user] = ?,  [password]  = ? where id= ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(2, c.getPassword());
            stm.setString(1, c.getAccount());
            stm.setInt(3, id);
            n = stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int DeleteAccount(String username) {
        int n = 0;
        try {

            String sql = "delete from account where user like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int DeleteAccountbyid(int id) {
        int n = 0;
        try {

            String sql = "delete from account where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Account checkUser(String user, String password) {
        String sql = "select * from account where [user] = ? and password = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setId(rs.getInt("id"));
                account.setAccount(rs.getString("user"));
                account.setPassword(rs.getString("password"));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    
    public int changePassword(String username,String oldpass,
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
            if (checkUser(username,oldpass) == null) {
                System.out.println("Account does not exist!");

            } else {

                // check OK
                String sql = "update [Account] set password=? where id=?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, newPass);
                stm.setInt(2, id);
                n = stm.executeUpdate();
                return n;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // check OK
        return n;
    }
       public Account checkUsername(String user) {
        String sql = "select * from account where [user] = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setId(rs.getInt("id"));
                account.setAccount(rs.getString("user"));
                account.setPassword(rs.getString("password"));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    

    public static void main(String[] args) {

        System.out.println(new AccountDAO().add(new Account("hieu12", "1234456aa", "guess"), "hieu12"));

    }
}
