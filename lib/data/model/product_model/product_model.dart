import 'package:flutter/cupertino.dart';

import '../rating.dart';

class ProductModel {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    debugPrint("ProductModel ok");
   return  ProductModel(
    id: json["id"]?? 0,
    title: json["title"] ?? '',
    price: json["price"] ?? 0 ,
    description: json["description"] ?? '',
    category: json["category"] ?? '',
    image: json["image"] ?? '',
    rating: json["rating"] != null
        ? Rating.fromJson(json["rating"])
        : Rating(
      rate: 0,
      count: 0,
    ),
  );}

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,

  };
  ProductModel copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image, rating: rating,
      );

}