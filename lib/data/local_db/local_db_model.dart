import 'package:flutter/cupertino.dart';

class LocalDbFields {
  static String productId = "";
  static String id = "";
  static String title = "";
  static String price = "";
  static String description = "";
  static String category = "";
  static String image = "";

  static String productTable = 'products';
}



class ProductModelLocalDb {
  int? productId;
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;

  ProductModelLocalDb({
    this.productId,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModelLocalDb.fromJson(Map<String, dynamic> json) {
    debugPrint("ProductModel ok");
    return ProductModelLocalDb(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      price: json["price"]?.toDouble() ?? 0.0,
      description: json["description"] ?? '',
      category: json["category"] ?? '',
      image: json["image"] ?? '',
    );
  }

  ProductModelLocalDb copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
  }) =>
      ProductModelLocalDb(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
