import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Implementar chamada real para API
      // Simulação de dados
      await Future.delayed(const Duration(seconds: 1));

      _categories = [
        Category(
          id: 1,
          name: 'Smartphones',
          slug: 'smartphones',
          description: 'Smartphones e celulares',
          image: 'https://via.placeholder.com/300x300?text=Smartphones',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Category(
          id: 2,
          name: 'Notebooks',
          slug: 'notebooks',
          description: 'Notebooks e laptops',
          image: 'https://via.placeholder.com/300x300?text=Notebooks',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Category(
          id: 3,
          name: 'Acessórios',
          slug: 'acessorios',
          description: 'Acessórios para dispositivos',
          image: 'https://via.placeholder.com/300x300?text=Acessorios',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Erro ao carregar categorias: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Category? getCategoryById(int id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }
}
