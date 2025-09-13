package com.nm.model;



public class user {
    private int id;
    private String name;
    private String email;
    private String password;
    public user() {}
    public user(String name, String email, String password) {
        this.name = name; this.email = email; this.password = password;
    }
    public user(int id,String name, String email, String password){
        this.id=id; this.name=name; this.email=email; this.password=password;
    }
    
    public int getId(){return id;}
    public void setId(int id){this.id=id;}
    public String getName(){return name;}
    public void setName(String n){this.name=n;}
    public String getEmail(){return email;}
    public void setEmail(String e){this.email=e;}
    public String getPassword(){return password;}
    public void setPassword(String p){this.password=p;}
}
