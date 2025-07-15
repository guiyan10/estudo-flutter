import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/order.dart';
import '../utils/constants.dart';

class OrderService {
  Future<List<Order>> getOrders(String token, {int page = 1}) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.orders + '?page=$page');
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null && data['data']['data'] != null) {
      return (data['data']['data'] as List).map((e) => Order.fromJson(e)).toList();
    }
    return [];
  }

  Future<Order?> getOrder(String token, int orderId) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.orders + '/$orderId');
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    final data = jsonDecode(response.body);
    if (data['success'] == true && data['data'] != null) {
      return Order.fromJson(data['data']);
    }
    return null;
  }

  Future<Map<String, dynamic>> checkout(String token, Map<String, dynamic> data) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.orders);
    final response = await http.post(uri, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    }, body: data);
    return jsonDecode(response.body);
  }
} 