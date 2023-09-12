import 'package:bloc/bloc.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';

import '../../data/local_db/local_sql.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  List<ProductModel> favorites = [];

  FavoritesBloc() : super(FavoritesLoadingState()) {
    on<FavoritesEvent>(favoritesCrud);
  }

  Stream<FavoritesState> favoritesCrud(
      FavoritesEvent event, Emitter<FavoritesState> emit) async* {
    print("favoritesCrud ok in bloc method ");

    if (event is AddToFavoritesEvent) {
      print("AddToFavoritesEvent ok in bloc");
      await LocalDatabase().insertFavorite(event.product);
      favorites.add(event.product);
    } else if (event is RemoveFromFavoritesEvent) {
      print("remoceFavoritesEvent ok in bloc");
      await LocalDatabase().deleteFavoriteByID(event.productId);
      favorites.removeWhere((product) => product.id == event.productId);
    } else if (event is GetFavoritesEvent) {
      print("GetFavoritesEvent ok in bloc");
      favorites = await LocalDatabase().getAllFavorites();
    }
    yield FavoritesLoadedState(List.from(favorites));
  }
}
