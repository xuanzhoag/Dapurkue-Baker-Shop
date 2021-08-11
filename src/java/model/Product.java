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
public class Product {

    private int id;
    private String name;

    private double price;
    private int quantity;
    private String imgName;
    private String description;
    private Category category;
    private int status;
    private int count;

    public Product(int id) {
        this.id = id;
    }

    public Product(int id, String name, double price, int quantity, String imgName, String description, Category category, int status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imgName = imgName;
        this.description = description;
        this.category = category;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", imgName=" + imgName + ", description=" + description + ", category=" + category + ", status=" + status + ", count=" + count + '}';
    }

    
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Product(int id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
