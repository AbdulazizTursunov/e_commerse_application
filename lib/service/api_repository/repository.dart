// import 'package:flutter/cupertino.dart';
//
// import '../../data/universal_response.dart';
// import '../api_service/api_service.dart';
//
// class ProductRepository {
//   final ProductService apiService;
//
//   ProductRepository({required this.apiService});
//
//   Future<UniversalResponse> getAllProduct() async {
//     debugPrint("getAllProduct kirdi repository");
//     return apiService.getAllProduct();
//   }
//
//   Future<UniversalResponse> getProductById(int id) async {
//     debugPrint("getProductById kirdi repository");
//     return apiService.getProductById(id);
//   }
// }
import 'package:dio/dio.dart';
import 'package:e_commerse_application/data/universal_response.dart';

import '../api_service/api_service.dart';

class ProductsService {

  final Dio dio = Dio();
   // ProductService productsService = ProductService();

  Future getProductsData() async {
    final response = await dio.get('https://fakestoreapi.com/products/');
    return response.data;
  }
  // Future getProductsData() async => productsService.getAllProduct();


  Future<Map<String, dynamic>> getProductDetails({required int id}) async {
    final response = await dio.get('https://fakestoreapi.com/products/$id');
    return response.data;
  }
  // Future<Future<UniversalResponse>> getProductDetails({required int id}) async => productsService.getProductById(id);
}
