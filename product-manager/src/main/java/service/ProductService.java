package service;

import model.Products;

import java.util.List;

public interface ProductService {
    List<Products> findAll();
    void addProduct(Products product);
    void updateProduct(int id, Products product);
    void deleteProduct(int id);
    Products findById(int id);
    List<Products> searchByName(String name);
}
