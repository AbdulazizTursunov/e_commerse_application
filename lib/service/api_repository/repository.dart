import 'package:dio/dio.dart';

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
