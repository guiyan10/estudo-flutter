import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_item.dart';
import '../utils/constants.dart';

class CartService {
  Future<List<CartItem>> getCart(String token) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.cart);
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null && data['data']['items'] != null) {
      return (data['data']['items'] as List).map((e) => CartItem.fromJson(e)).toList();
    }
    return [];
  }

  Future<Map<String, dynamic>> addToCart(String token, int productId, int quantity) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.addToCart);
    final response = await http.post(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    }, body: {
      'product_id': productId.toString(),
      'quantity': quantity.toString(),
    });
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> updateCartItem(String token, int cartItemId, int quantity) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.cart + '/$cartItemId');
    final response = await http.put(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    }, body: {
      'quantity': quantity.toString(),
    });
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> removeCartItem(String token, int cartItemId) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.cart + '/$cartItemId');
    final response = await http.delete(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> clearCart(String token) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.cart);
    final response = await http.delete(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    return jsonDecode(response.body);
  }
} 