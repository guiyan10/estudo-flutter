import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/constants.dart';

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
      final response =
          await http.get(Uri.parse('${ApiConstants.baseUrl}/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _products = (data['data']['data'] as List)
            .map((item) => Product.fromJson(item))
            .toList();
        _filteredProducts = _products;
        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Erro ao buscar produtos');
      }
    } catch (e) {
      _error = 'Erro ao carregar produtos: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Product?> fetchProductById(int id) async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.baseUrl}/products/$id'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Product.fromJson(data['data']);
      } else {
        throw Exception('Erro ao buscar produto');
      }
    } catch (e) {
      _error = 'Erro ao carregar produto: $e';
      notifyListeners();
      return null;
    }
  }

  Future<bool> createProduct(Product product) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/products'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );
      if (response.statusCode == 201) {
        await fetchProducts();
        return true;
      } else {
        _error = 'Erro ao criar produto';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Erro ao criar produto: $e';
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateProduct(Product product) async {
    try {
      final response = await http.put(
        Uri.parse('${ApiConstants.baseUrl}/products/${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(product.toJson()),
      );
      if (response.statusCode == 200) {
        await fetchProducts();
        return true;
      } else {
        _error = 'Erro ao atualizar produto';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Erro ao atualizar produto: $e';
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteProduct(int id) async {
    try {
      final response =
          await http.delete(Uri.parse('${ApiConstants.baseUrl}/products/$id'));
      if (response.statusCode == 200) {
        await fetchProducts();
        return true;
      } else {
        _error = 'Erro ao excluir produto';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Erro ao excluir produto: $e';
      notifyListeners();
      return false;
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
