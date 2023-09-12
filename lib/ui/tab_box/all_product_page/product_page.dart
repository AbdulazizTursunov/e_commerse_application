import 'package:e_commerse_application/ui/tab_box/all_product_page/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/product_bloc/products_bloc.dart';
import '../../../bloc/product_bloc/products_event.dart';
import '../../../bloc/product_bloc/products_state.dart';
import '../../../service/api_repository/repository.dart';
import '../../ui_utils/custom_circular.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

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
      appBar: AppBar(),
      body:BlocBuilder<ProductsBloc, ProductsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              print("loadinga tushdi");
              return const Center(
                child: CustomCircularProgressIndicator(),
              );
            } else if (state is ProductsSuccessState) {
              print("succesga tushdi");
              return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                  id: state.products[index].id),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text("${state.products[index].title.toString()} (${state.products[index].price.toString()})",style: TextStyle(color: Colors.black),),
                        ),
                      );
                    }));

            } else {
              return Container(child: Text("data"),);
            }
          },
        ),
    );
  }
}
