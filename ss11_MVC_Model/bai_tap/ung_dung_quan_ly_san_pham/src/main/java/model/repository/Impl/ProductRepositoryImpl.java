package model.repository.Impl;
import model.bean.Product;
import model.repository.IProductRepository;

import java.util.*;

public class ProductRepositoryImpl implements IProductRepository {
    private static Map<Integer, Product> productList = new HashMap<>();

    static {
        productList.put(1, new Product(1, "Toyota Vios", 30000, "New car", "Toyota"));
        productList.put(2, new Product(2, "Huyndai Accent", 24000, "New car", "Hyundai"));
        productList.put(3, new Product(3, "Mazda 3", 35000, "New car", "Mazda"));
        productList.put(4, new Product(4, "Toyota Camry", 55000, "New car", "Toyota"));
        productList.put(5, new Product(5, "Hyundai Grand i10", 23000, "New car", "Hyundai"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void save(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        productList.put(id, product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        Set<Product> productSet = new HashSet(productList.values());
        List<Product> products = new ArrayList<>();
        for (Product product : productSet) {
            if (product.getName().contains(name)) {
                products.add(productList.get(product.getId()));
            }
        }
        return products;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }
}
