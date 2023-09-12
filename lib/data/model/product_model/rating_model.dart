import 'package:flutter/cupertino.dart';

class RatingModel {
  num rate;
  int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    debugPrint("RatingModel ok");
   return RatingModel(
    rate: json["rate"] ?? 0,
    count: json["count"] ?? 0,
  );}

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
