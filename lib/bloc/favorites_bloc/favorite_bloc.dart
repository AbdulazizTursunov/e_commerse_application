import 'package:bloc/bloc.dart';
import '../../data/local_db/local_sql.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitialState()) {
    on<AddToFavoritesEvent>(_addToFavorites);
    on<RemoveFromFavoritesEvent>(_removeFromFavorites);
    on<GetFavoritesEvent>(_getFavorites);
  }

  void _addToFavorites(
      AddToFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());
    await LocalDatabase().insertFavorite(event.product);
    emit(FavoritesInitialState());
  }

  void _removeFromFavorites(
      RemoveFromFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());

    await LocalDatabase().deleteFavoriteByID(event.productId);
    emit(FavoritesInitialState());
  }

  void _getFavorites(
      GetFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());

    var favorites = await LocalDatabase().getAllFavorites();
    print("Getting favorites");

    emit(FavoritesLoadedState(favorites));
  }
}
