package com.example.customerlistjsp;

public class Customer {
    private String name;
    private String birthdate;
    private String address;
    private String image;

    public Customer(String name, String birthdate, String address, String image) {
        this.name = name;
        this.birthdate = birthdate;
        this.address = address;
        this.image = image;
    }

    @Override
    public String toString() {
        return "com.example.customerlistjsp.Customer{" +
                "name='" + name + '\'' +
                ", birthdate='" + birthdate + '\'' +
                ", address='" + address + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
