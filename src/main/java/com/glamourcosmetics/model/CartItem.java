package com.glamourcosmetics.model;

public class CartItem {

    private int productId;
    private String name;
    private double price;
    private int quantity;
    private String image;

    public CartItem(int productId, String name, double price, int quantity, String image) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    // getters & setters


    public int getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
    public String getImage() {
        return image;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
