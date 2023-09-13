


import 'package:equatable/equatable.dart';

class ProductsEvent extends Equatable {
  get id => null;
  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductsEvent{}

class GetProductDetailsEvent extends ProductsEvent{
 final  int id;
  GetProductDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}
