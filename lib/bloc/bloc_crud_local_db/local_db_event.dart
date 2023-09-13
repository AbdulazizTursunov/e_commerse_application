


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerse_application/data/local_db/local_sql.dart';
import 'package:e_commerse_application/data/local_db/local_db_model.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';


abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final ProductModel product;

  const AddToCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFromCartEvent extends CartEvent {
  final int productId;

  RemoveFromCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class GetCartEvent extends CartEvent {}
