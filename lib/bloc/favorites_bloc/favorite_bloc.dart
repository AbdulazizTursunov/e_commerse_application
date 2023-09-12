import 'package:bloc/bloc.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import '../../service/api_repository/db_repositories.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  List<ProductModel> favorites = [];
  final ProductRepository productRepository;

  FavoritesBloc({required this.productRepository}) : super(FavoritesLoadingState()) {
    on<FavoritesEvent>(favoritesCrud);
  }

  Stream<FavoritesState> favoritesCrud(
      FavoritesEvent event, Emitter<FavoritesState> emit) async* {
    print("favoritesCrud ok in bloc method ");

    if (event is AddToFavoritesEvent) {
      print("AddToFavoritesEvent ok in bloc");
      productRepository.insertFavorites(event.product);
      favorites.add(event.product);
    } else if (event is RemoveFromFavoritesEvent) {
      print("remoceFavoritesEvent ok in bloc");
      productRepository.deleteFavoritesById(event.productId);
      favorites.removeWhere((product) => product.id == event.productId);
    } else if (event is GetFavoritesEvent) {
      print("GetFavoritesEvent ok in bloc");
      productRepository.getAllFavorites();
    }
    yield FavoritesLoadedState(List.from(favorites));
  }
}
