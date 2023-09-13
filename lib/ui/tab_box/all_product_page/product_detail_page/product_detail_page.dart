import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_application/utils/sizebox_extension_for_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../bloc/product_bloc/products_bloc.dart';
import '../../../../bloc/product_bloc/products_event.dart';
import '../../../../bloc/product_bloc/products_state.dart';
import '../../../../data/model/product_detail/product_detail_model.dart';
import '../../../../service/api_repository/repository.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/shimmer_detail.dart';
import '../../../../widgets/shimmer_image.dart';
import '../../../ui_utils/custom_circular.dart';

class ProductDetailsPage extends StatefulWidget {
  final int id;

  const ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final bloc = ProductsBloc(ProductsService());

  @override
  void initState() {
    super.initState();
    bloc.add(GetProductDetailsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:const Icon(Icons.arrow_back_rounded,color: AppColors.black),),
        title: Text("Product Details Page",
            style: TextStyle(fontSize: 18.sp, color: AppColors.black)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ProductsIdLoadingState) {
            return const  Center(
              child:  ShimmerDetailPage(),
            );
          } else if (state is ProductsIdSuccessState) {
            ProductDetailsModel productDetailsModel = state.productDetailsModel;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.amber),
                        color: AppColors.white),
                    padding: EdgeInsets.all(15.w),
                    child: Center(
                      child: CachedNetworkImage(
                        placeholder: (context, url) => ShimmerImage(
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 2),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image),
                        imageUrl: productDetailsModel.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.ph,
                  Text(
                    "CATEGORY: ${(productDetailsModel.category)}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.c5EA3B4),
                  ),
                  10.ph,
                  Text(
                    "TITLE: ${(productDetailsModel.title)}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  10.ph,
                  Text(
                    "PRICE: ${(productDetailsModel.price)}\$",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  10.ph,
                  Row(
                    children: [
                      Text(
                        "COUNT: ${(productDetailsModel.rating?.count.toString())}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      20.pw,
                      Row(
                        children: [
                          Text(
                            "RATE: ${(productDetailsModel.rating!.rate.toString())}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          10.pw,
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        ],
                      )
                    ],
                  ),
                  10.ph,
                  Wrap(children: [
                    Text(
                      "DESCRIPTION: ${(productDetailsModel.description)}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ]),
                ],
              ),
            );
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
