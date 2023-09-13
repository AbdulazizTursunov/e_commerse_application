

import 'package:e_commerse_application/data/model/product_detail/product_detail_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/product_model/product_model.dart';


abstract class ProductsState extends Equatable {}

class ProductsInitial extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ProductsLoadingState extends ProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ProductsSuccessState extends ProductsState {

 final List products;

  ProductsSuccessState({required this.products});

  @override
  List<Object> get props => [products];

}
class ProductsErrorState extends ProductsState {
  final String errortext;
  ProductsErrorState({required this.errortext});

  @override
  List<Object?> get props => [errortext];
}


class ProductsIdInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}
class ProductsIdLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}
class ProductsIdSuccessState extends ProductsState {

 final ProductDetailsModel productDetailsModel;

  ProductsIdSuccessState({required this.productDetailsModel});

  @override
  List<Object> get props => [productDetailsModel];

}
class ProductsIdErrorState extends ProductsState {
  @override
  List<Object?> get props => [];
}
