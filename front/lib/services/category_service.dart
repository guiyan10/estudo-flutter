import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/product.dart';
import '../utils/constants.dart';

class CategoryService {
  Future<List<Category>> getCategories() async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.categories);
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null) {
      return (data['data'] as List).map((e) => Category.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Product>> getProductsByCategory(int categoryId, {String? search, String? sort, int page = 1}) async {
    final queryParams = <String, String>{'page': page.toString()};
    if (search != null) queryParams['search'] = search;
    if (sort != null) queryParams['sort'] = sort;
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.categories + '/$categoryId/products').replace(queryParameters: queryParams);
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null && data['data']['products'] != null) {
      return (data['data']['products']['data'] as List).map((e) => Product.fromJson(e)).toList();
    }
    return [];
  }
} 