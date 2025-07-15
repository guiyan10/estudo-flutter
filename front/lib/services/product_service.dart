import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/constants.dart';

class ProductService {
  Future<List<Product>> getProducts({String? search, int? categoryId, String? sort, int page = 1}) async {
    final queryParams = <String, String>{'page': page.toString()};
    if (search != null) queryParams['search'] = search;
    if (categoryId != null) queryParams['category_id'] = categoryId.toString();
    if (sort != null) queryParams['sort'] = sort;
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.products).replace(queryParameters: queryParams);
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null && data['data']['data'] != null) {
      return (data['data']['data'] as List).map((e) => Product.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Product>> getFeaturedProducts() async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.featuredProducts);
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null) {
      return (data['data'] as List).map((e) => Product.fromJson(e)).toList();
    }
    return [];
  }

  Future<Product?> getProduct(int id) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.products + '/$id');
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null) {
      return Product.fromJson(data['data']);
    }
    return null;
  }
} 