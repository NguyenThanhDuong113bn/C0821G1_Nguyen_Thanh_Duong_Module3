package model.service.Impl;

import model.bean.Product;
import model.repository.Impl.ProductRepositoryImpl;
import model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    ProductRepositoryImpl productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id, product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}