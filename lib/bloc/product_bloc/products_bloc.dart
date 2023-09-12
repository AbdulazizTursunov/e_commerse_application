

import 'package:e_commerse_application/bloc/product_bloc/products_event.dart';
import 'package:e_commerse_application/data/model/product_detail/product_detail_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/product_model/product_model.dart';
import '../../service/api_repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsService productsService;

  ProductsBloc(this.productsService) : super(ProductsInitial()) {
    on<GetProductsEvent>(loadData);
    on<GetProductDetailsEvent>(loadDataWithId);

  }

  loadData(ProductsEvent productsEvent, Emitter emit) async {
    emit(ProductsLoadingState());
    try {
      final productsData = await productsService.getProductsData();

      var products = (productsData as List).map((e) => ProductModel.fromJson(e)).toList();
      emit(ProductsSuccessState(products: products));
    } catch (e) {
      print(e);
      emit(ProductsErrorState(errortext: e.toString()));
    }
  }


  loadDataWithId(ProductsEvent productIdEvent, Emitter emit) async {
    emit(ProductsIdLoadingState());
    try {
      print("a");
      final productsData = await productsService.getProductDetails(id:productIdEvent.id);
      print("a1");
      var product = ProductDetailsModel.fromJson(productsData as Map<String, dynamic>);

      print("b");
      emit(ProductsIdSuccessState(productDetailsModel: product));
    } catch (e) {
      print(e);
      emit(ProductsErrorState(errortext: e.toString()));
    }
  }
}