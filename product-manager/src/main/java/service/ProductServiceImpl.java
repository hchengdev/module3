package service;

import model.Products;

import java.util.*;

public class ProductServiceImpl implements ProductService{
    private static Map<Integer, Products> products;
    static {
        products = new HashMap<>();
        products.put(1, new Products(1, "Product 1", 10.99, "Description 1", "Manufacturer 1"));
        products.put(2, new Products(2, "Product 2", 15.99, "Description 2", "Manufacturer 2"));
        products.put(3, new Products(3, "Product 3", 20.99, "Description 3", "Manufacturer 3"));
        products.put(4, new Products(4, "Product 4", 25.99, "Description 4", "Manufacturer 4"));
        products.put(5, new Products(5, "Product 5", 30.99, "Description 5", "Manufacturer 5"));
        products.put(6, new Products(6, "Product 6", 35.99, "Description 6", "Manufacturer 6"));
    }
    @Override
    public List<Products> findAll() {
        return new ArrayList<> (products.values());
    }

    @Override
    public void addProduct(Products product) {
        products.put(product.getId(), product);
    }

    @Override
    public void updateProduct(int id, Products product) {
        products.put(id, product);
    }

    @Override
    public void deleteProduct(int id) {
        products.remove(id);
    }

    @Override
    public Products findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Products> searchByName(String name) {
        List<Products> result = new ArrayList<>();
        for (Products product : products.values()) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }
}
