import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerse_application/service/api_repository/db_repositories.dart';
import 'package:e_commerse_application/utils/sizebox_extension_for_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../bloc/favorites_bloc/favorite_bloc.dart';
import '../../../bloc/favorites_bloc/favorite_event.dart';
import '../../../bloc/favorites_bloc/favorite_state.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/basket_button.dart';
import '../../../widgets/shimmer_image.dart';
import '../../ui_utils/custom_circular.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  ProductRepository productRepository = ProductRepository();
  @override
  Widget build(BuildContext context) {
    context.read<FavoritesBloc>().add(GetFavoritesEvent());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text("My Favorite Products",
            style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesLoadedState) {
            List<ProductModel> favorites = state.favorites;
            if (favorites.isEmpty) {
              return const Center(child: Text('Favorites is empty'));
            } else {
              return GridView.builder(
                  itemCount: favorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.5),
                  itemBuilder: (context, int index) {
                    final product = favorites[index];
                    return InkWell(
                      onLongPress: (){
                        setState(() {
                        });
                        productRepository.deleteFavoritesById(product.id);

                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border:
                                Border.all(color: AppColors.cC7BA96, width: 2.3),
                            color: AppColors.white),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        ShimmerImage(height: 220.h, width: 200.w),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.picture_in_picture_alt),
                                    imageUrl: product.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              10.ph,
                              Text(
                                product.title,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              10.ph,
                              Text(
                                product.category,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              10.ph,
                              Text(
                                "price: ${product.price.toString()}\$",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              10.ph,
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      " count: ${(product.rating.count).toString()} ",
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                    ),
                                    5.ph,
                                    Row(children: [
                                      Text(
                                        "rate: ${(product.rating.rate.toString())}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      10.pw,
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ])
                                  ]),
                              BasketButton(productModel: product)
                            ]),
                      ),
                    );
                  });
            }
          } else {
            return CustomCircularProgressIndicator(
              context: context,
              strokeWidth: 6.w,
            );
          }
        },
      ),
    );
  }
}

