import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'package:e_commerse_application/ui/route/route_names.dart';
import 'package:e_commerse_application/utils/sizebox_extension_for_utils.dart';
import 'package:e_commerse_application/widgets/basket_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import '../../../bloc/product_bloc/products_bloc.dart';
import '../../../bloc/product_bloc/products_event.dart';
import '../../../bloc/product_bloc/products_state.dart';
import '../../../service/api_repository/repository.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/global_like_button.dart';
import '../../../widgets/shimmer_image.dart';
import '../../../widgets/shimmer_product.dart';
import '../../ui_utils/custom_circular.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);
static ProductModel? product;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final bloc = ProductsBloc(ProductsService());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Product  Page",
          style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(
              child: ShimmerProductScreen(),
            );
          } else if (state is ProductsSuccessState) {
            return GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.5),
                itemBuilder: (context, int index) {
                  ProductModel productModel = state.products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.productDetail,
                          arguments: productModel.id);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.all( 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: AppColors.cE8EDE6,width: 2.3),
                          color: AppColors.white),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child:
                                Center(
                                  child: CachedNetworkImage(

                                    placeholder: (context, url) =>
                                         ShimmerImage(
                                            height: 220, width: 200),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                            Icons.picture_in_picture_alt),
                                    imageUrl: productModel.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ),
                            10.ph,
                            Text(
                              productModel.title,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            5.ph,
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                productModel.category,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            5.ph,
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "price: ${productModel.price.toString()}\$",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),20.pw,
                                  GlobalLikeButton(product:productModel)
                                ],
                              ),
                            ),
                            5.ph,
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    " count: ${(productModel.rating.count).toString()} ",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  5.ph,
                                  Row(children: [
                                    Text(
                                      "rate: ${(productModel.rating.rate.toString())}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    10.pw,
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )
                                  ])
                                ]),
                            BasketButton(productModel: productModel)
                          ]),
                    ),
                  );
                });
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
