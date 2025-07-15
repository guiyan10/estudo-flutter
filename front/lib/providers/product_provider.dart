import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Implementar chamada real para API
      // Simulação de dados
      await Future.delayed(const Duration(seconds: 1));

      _products = [
        Product(
          id: 1,
          name: 'Smartphone Galaxy S21',
          description: 'Smartphone Samsung Galaxy S21 com câmera de 64MP',
          price: 2999.99,
          image: 'https://via.placeholder.com/300x300?text=Smartphone',
          categoryId: 1,
          stock: 10,
          isFeatured: true,
          isActive: true,
          rating: 4.5,
          reviewsCount: 120,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Product(
          id: 2,
          name: 'Notebook Dell Inspiron',
          description: 'Notebook Dell Inspiron 15 polegadas com Intel i5',
          price: 3999.99,
          image: 'https://via.placeholder.com/300x300?text=Notebook',
          categoryId: 2,
          stock: 5,
          isFeatured: false,
          isActive: true,
          rating: 4.2,
          reviewsCount: 85,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Product(
          id: 3,
          name: 'Fone de Ouvido Bluetooth',
          description: 'Fone de ouvido sem fio com cancelamento de ruído',
          price: 299.99,
          image: 'https://via.placeholder.com/300x300?text=Fone',
          categoryId: 3,
          stock: 20,
          isFeatured: true,
          isActive: true,
          rating: 4.8,
          reviewsCount: 200,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      _filteredProducts = _products;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Erro ao carregar produtos: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Product?> fetchProductById(int id) async {
    try {
      // TODO: Implementar chamada real para API
      await Future.delayed(const Duration(seconds: 1));

      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      _error = 'Erro ao carregar produto: $e';
      notifyListeners();
      return null;
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void filterByCategory(int categoryId) {
    if (categoryId == 0) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) => product.categoryId == categoryId)
          .toList();
    }
    notifyListeners();
  }
}
