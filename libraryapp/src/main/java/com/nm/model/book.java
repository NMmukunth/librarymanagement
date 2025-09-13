package com.nm.model;



public class book {
    private int id;
    private String title;
    private String author;
    private String category;
    private int quantity;

    public book() {}
    public book(String title, String author, String category, int quantity) {
        this.title = title; this.author = author; this.category = category; this.quantity = quantity;
    }
    public book(int id, String title, String author, String category, int quantity) {
        this(title, author, category, quantity); this.id = id;
    }
    
    public int getId() { return id; }
    public void setId(int id) { 
    	this.id = id;
    	}
    public String getTitle() { 
    	return title; 
    	}
    public void setTitle(String t) { this.title = t; }
    public String getAuthor() { return author; }
    public void setAuthor(String a) { this.author = a; }
    public String getCategory() { return category; }
    public void setCategory(String c) { this.category = c; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int q) { this.quantity = q; }
}
