import 'package:e_commerse_application/service/api_repository/db_repositories.dart';
import 'package:e_commerse_application/service/api_repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import '../../../bloc/favorites_bloc/favorite_bloc.dart';
import '../../../bloc/favorites_bloc/favorite_event.dart';
import '../../../bloc/favorites_bloc/favorite_state.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key, this.product}) : super(key: key);
  final ProductModel? product;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final bloc = FavoritesBloc(productRepository: ProductRepository());

  @override
  void initState() {
    print("inirstatega kirdi");
    super.initState();
    if (widget.product != null) {
      print("AddToFavoritesEventga favorit pageda kirdi");
      bloc.add(AddToFavoritesEvent(widget.product!));
    }
    bloc.add(GetFavoritesEvent());
    print("GetFavoritesEvent favorit pageda kirdi");

  }

  @override
  Widget build(BuildContext context) {
    print("favorite pageda build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {},
        bloc: bloc,
        builder: (context, state) {
          print("favorite pageda builder");

          if (state is FavoritesLoadingState) {
            print("FavoritesLoadingState favorit pageda kirdi");
            return const Center(child: Text("loading"));
          } else if (state is FavoritesLoadedState) {
            print("FavoritesLoadedState favorit pageda kirdi");
            List<ProductModel> favorites = state.favorites;
            if (favorites.isEmpty) {
              return const Center(child: Text('Favorites is empty'));
            } else {
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.price.toString()),
                  );
                },
              );
            }
          } else {
            return Center(child: Text('Error loading favorites'));
          }
        },
      ),
    );
  }
}
