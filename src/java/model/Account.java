/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author xuanh
 */
public class Account {

    private int id;
    private String account;
    private String password;
    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    
    public Account(int id, String account, String password, String role) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.role = role;
    }

    public Account(String account, String password, String role) {
        this.account = account;
        this.password = password;
        this.role = role;
    }
    

    public Account(int id, String account, String password) {
        this.id = id;
        this.account = account;
        this.password = password;
    }

    public Account(String account) {
        this.account = account;
    }

    
    public Account(String account, String password) {
        this.account = account;
        this.password = password;
    }
    

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", account=" + account + ", password=" + password + ", role=" + role + '}';
    }

 

}
