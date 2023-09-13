import 'package:dio/dio.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'package:e_commerse_application/data/universal_response.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/constant/constant_filds.dart';

class ProductService {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ProductService() {
    _init();
  }

  _init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          // error.response.statusCode
          debugPrint("ERRORGA TUSHDI: ${error.message} and ${error.response}");
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint("SO'ROV YUBORILDI: ${requestOptions.path}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("JAVOB KELDI: ${response.requestOptions.path}");
          return handler.next(response);
        },
      ),
    );
  }


  Future<UniversalResponse> getAllProduct() async {
    debugPrint("getAllProduct kirdi");
    try {
      final response = await dio.get('https://fakestoreapi.com/products/');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalResponse(
            data: ((response.data) as List<dynamic>?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalResponse(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getProductById(int id) async {
    debugPrint("getProductById kirdi");
    try {
      final response = await dio.get('https://fakestoreapi.com/products/$id');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalResponse(data: ProductModel.fromJson(response.data));
      }
      return UniversalResponse(error: "Other Error");
    } on DioException catch (e) {
      return getDioCustomError(e);
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }


  UniversalResponse getDioCustomError(DioException exception) {
    debugPrint("DIO ERROR TYPE: ${exception.type}");
    if (exception.response != null) {
      return UniversalResponse(error: exception.response!.data.toString());
    }
    switch (exception.type) {
      case DioExceptionType.sendTimeout:
        return UniversalResponse(error: "sendTimeout");
      case DioExceptionType.receiveTimeout:
        return UniversalResponse(error: "receiveTimeout");
      case DioExceptionType.cancel:
        return UniversalResponse(error: "cancel");
      case DioExceptionType.badCertificate:
        return UniversalResponse(error: "badCertificate");
      case DioExceptionType.badResponse:
        return UniversalResponse(error: "badResponse");
      case DioExceptionType.connectionTimeout:
        return UniversalResponse(error: "connectionTimeout");
      default:
        return UniversalResponse(error: "unknown");
    }
  }
}

