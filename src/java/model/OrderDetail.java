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
public class OrderDetail {

    private String id;
    private Order orderid;
    private Product productid;
    private double total;
    private double price;
    private int quantity;
    private double size;

    private double sumtotal;
    private int count;
    
    

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    private int maxOrdid;

    public int getMaxOrdid() {
        return maxOrdid;
    }

    public void setMaxOrdid(int maxOrdid) {
        this.maxOrdid = maxOrdid;
    }
    
    
    public double getSumtotal() {
        return sumtotal;
    }
    public void setSumtotal(double sumtotal) {
        this.sumtotal = sumtotal;
    }
    public OrderDetail(String id, Order orderid, Product productid, double total, double price, int quantity, double size, double sumtotal) {
        this.id = id;
        this.orderid = orderid;
        this.productid = productid;
        this.total = total;
        this.price = price;
        this.quantity = quantity;
        this.size = size;
        this.sumtotal = sumtotal;
    }

   

    public OrderDetail(String id, Order orderid, Product productid, double total, double price, int quantity, double sumtotal) {
        this.id = id;
        this.orderid = orderid;
        this.productid = productid;
        this.total = total;
        this.price = price;
        this.quantity = quantity;
        this.sumtotal = sumtotal;
    }

    public OrderDetail() {
    }

    public OrderDetail(String id, Order orderid, Product productid, double total, double price, int quantity) {
        this.id = id;
        this.orderid = orderid;
        this.productid = productid;
        this.total = total;
        this.price = price;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", orderid=" + orderid + ", productid=" + productid + ", total=" + total + ", price=" + price + ", quantity=" + quantity + ", size=" + size + ", sumtotal=" + sumtotal + ", count=" + count + ", maxOrdid=" + maxOrdid + '}';
    }

    

 

    public OrderDetail(Order orderid, Product productid, double total, double price, int quantity) {
        this.orderid = orderid;
        this.productid = productid;
        this.total = total;
        this.price = price;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Order getOrderid() {
        return orderid;
    }

    public void setOrderid(Order orderid) {
        this.orderid = orderid;
    }

    public Product getProductid() {
        return productid;
    }

    public void setProductid(Product productid) {
        this.productid = productid;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

}
