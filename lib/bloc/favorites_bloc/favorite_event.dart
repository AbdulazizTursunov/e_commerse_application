import 'package:equatable/equatable.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';

// Eventlar
abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object?> get props => [];
}

class AddToFavoritesEvent extends FavoritesEvent {
  final ProductModel product;

  const AddToFavoritesEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFromFavoritesEvent extends FavoritesEvent {
  final int productId;

  const  RemoveFromFavoritesEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class GetFavoritesEvent extends FavoritesEvent {}