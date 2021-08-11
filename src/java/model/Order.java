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
public class Order {

    private int id;
    private String name, mobile, address;
    private Double money;
    private int status;
    private Customer CusID;
    private String date;
    private int sum;

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Customer getCusID() {
        return CusID;
    }

    public void setCusID(Customer CusID) {
        this.CusID = CusID;
    }

    public Order(int id, String name, String mobile, String address, Double money, int status, Customer CusID, String date) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.money = money;
        this.status = status;
        this.CusID = CusID;
        this.date = date;
    }

    public Order(int id, String name, String mobile, String address, Double money, int status, Customer CusID) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.money = money;
        this.status = status;
        this.CusID = CusID;
    }

    public Order(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", name=" + name + ", mobile=" + mobile + ", address=" + address + ", money=" + money + ", status=" + status + ", CusID=" + CusID + ", date=" + date + '}';
    }

    public Order() {
    }

   

    public Order(String name, String mobile, String address, Double money, int status, Customer CusID) {
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.money = money;
        this.status = status;
        this.CusID = CusID;
    }
    

}
