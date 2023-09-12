

import 'package:e_commerse_application/data/model/product_detail/product_detail_model.dart';

import '../../data/model/product_model/product_model.dart';


abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoadingState extends ProductsState {}
class ProductsSuccessState extends ProductsState {

  List products;

  ProductsSuccessState({required this.products});

  @override
  List<Object> get props => [products];

}
class ProductsErrorState extends ProductsState {
  final String errortext;
  ProductsErrorState({required this.errortext});
}


class ProductsIdInitial extends ProductsState {}
class ProductsIdLoadingState extends ProductsState {}
class ProductsIdSuccessState extends ProductsState {

  ProductDetailsModel productDetailsModel;

  ProductsIdSuccessState({required this.productDetailsModel});

  @override
  List<Object> get props => [productDetailsModel];

}
class ProductsIdErrorState extends ProductsState {}
