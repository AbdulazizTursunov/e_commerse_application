import 'package:equatable/equatable.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';

class CartState extends Equatable {
 const CartState();

 @override
 List<Object?> get props => [];
}
class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
 final List<ProductModel> cart;

 const CartLoadedState(this.cart);

 @override
 List<Object?> get props => [cart];
}

class CartErrorState extends CartState {}