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
public class Customer {

    private String id;
    private String cname, cphone, cAddress, username, password;
    private int status;
    private int count;
    public Customer() {
    }

    public Customer(String id) {
        this.id = id;
    }

    public Customer(String cname, String cphone, String cAddress) {
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
    }

   
    
   
    

    public Customer(String id, String cname, String cphone, String cAddress, String username, String password, int status) {
        this.id = id;
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public Customer(String cname, String cphone, String cAddress, String username, int status) {
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.username = username;
        this.status = status;
    }

    public Customer(String phone, String address) {
       this.cphone = cphone;
        this.cAddress = cAddress;   }

    @Override
    public String toString() {
        return "Customer{" + "id=" + id + ", cname=" + cname + ", cphone=" + cphone + ", cAddress=" + cAddress + ", username=" + username + ", password=" + password + ", status=" + status + ", count=" + count + '}';
    }

  

   

    
    public Customer(String cname, String cphone, String cAddress, String username, String password, int status) {
        this.cname = cname;
        this.cphone = cphone;
        this.cAddress = cAddress;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

  

  
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

   
}
