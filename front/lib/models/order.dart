import 'order_item.dart';

class Order {
  final int id;
  final int userId;
  final double total;
  final String status;
  final String orderNumber;
  final String shippingAddress;
  final String shippingCity;
  final String shippingState;
  final String shippingZipCode;
  final String shippingPhone;
  final String? notes;
  final List<OrderItem> orderItems;
  final DateTime createdAt;
  final DateTime updatedAt;

  Order({
    required this.id,
    required this.userId,
    required this.total,
    required this.status,
    required this.orderNumber,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingState,
    required this.shippingZipCode,
    required this.shippingPhone,
    this.notes,
    required this.orderItems,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      total: double.parse(json['total'].toString()),
      status: json['status'],
      orderNumber: json['order_number'],
      shippingAddress: json['shipping_address'],
      shippingCity: json['shipping_city'],
      shippingState: json['shipping_state'],
      shippingZipCode: json['shipping_zip_code'],
      shippingPhone: json['shipping_phone'],
      notes: json['notes'],
      orderItems: json['order_items'] != null
          ? (json['order_items'] as List)
              .map((item) => OrderItem.fromJson(item))
              .toList()
          : [],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'total': total,
      'status': status,
      'order_number': orderNumber,
      'shipping_address': shippingAddress,
      'shipping_city': shippingCity,
      'shipping_state': shippingState,
      'shipping_zip_code': shippingZipCode,
      'shipping_phone': shippingPhone,
      'notes': notes,
      'order_items': orderItems.map((item) => item.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  String get formattedTotal {
    return 'R\$ ${total.toStringAsFixed(2)}';
  }

  String get formattedDate {
    return '${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}';
  }

  Order copyWith({
    int? id,
    int? userId,
    double? total,
    String? status,
    String? orderNumber,
    String? shippingAddress,
    String? shippingCity,
    String? shippingState,
    String? shippingZipCode,
    String? shippingPhone,
    String? notes,
    List<OrderItem>? orderItems,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      total: total ?? this.total,
      status: status ?? this.status,
      orderNumber: orderNumber ?? this.orderNumber,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      shippingCity: shippingCity ?? this.shippingCity,
      shippingState: shippingState ?? this.shippingState,
      shippingZipCode: shippingZipCode ?? this.shippingZipCode,
      shippingPhone: shippingPhone ?? this.shippingPhone,
      notes: notes ?? this.notes,
      orderItems: orderItems ?? this.orderItems,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, orderNumber: $orderNumber, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 