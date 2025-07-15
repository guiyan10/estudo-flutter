import 'category.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String? image;
  final int stock;
  final int categoryId;
  final bool isFeatured;
  final bool isActive;
  final double rating;
  final int reviewsCount;
  final Category? category;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.stock,
    required this.categoryId,
    required this.isFeatured,
    required this.isActive,
    required this.rating,
    required this.reviewsCount,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      image: json['image'],
      stock: json['stock'],
      categoryId: json['category_id'],
      isFeatured: json['is_featured'] ?? false,
      isActive: json['is_active'] ?? true,
      rating: double.parse(json['rating'].toString()),
      reviewsCount: json['reviews_count'],
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'stock': stock,
      'category_id': categoryId,
      'is_featured': isFeatured,
      'is_active': isActive,
      'rating': rating,
      'reviews_count': reviewsCount,
      'category': category?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? image,
    int? stock,
    int? categoryId,
    bool? isFeatured,
    bool? isActive,
    double? rating,
    int? reviewsCount,
    Category? category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      stock: stock ?? this.stock,
      categoryId: categoryId ?? this.categoryId,
      isFeatured: isFeatured ?? this.isFeatured,
      isActive: isActive ?? this.isActive,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get formattedPrice {
    return 'R\$ ${price.toStringAsFixed(2)}';
  }

  String get formattedRating {
    return rating.toStringAsFixed(1);
  }

  bool get isInStock {
    return stock > 0;
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 