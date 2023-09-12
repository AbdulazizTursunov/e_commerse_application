import 'package:equatable/equatable.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';




abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesLoadingState extends FavoritesState {}
class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {
  final List<ProductModel> favorites;

  const FavoritesLoadedState(this.favorites);

  @override
  List<Object?> get props => [favorites];
}

class FavoritesErrorState extends FavoritesState {}