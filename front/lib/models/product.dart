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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? '',
      categoryId: json['category_id'] ?? 0,
      stock: json['stock'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      isActive: json['is_active'] ?? true,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json['reviews_count'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category_id': categoryId,
      'stock': stock,
      'is_featured': isFeatured,
      'is_active': isActive,
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
