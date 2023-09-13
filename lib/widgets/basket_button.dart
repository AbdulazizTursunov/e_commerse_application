import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_crud_local_db/local_db_bloc.dart';
import '../bloc/bloc_crud_local_db/local_db_event.dart';
import '../data/model/product_model/product_model.dart';
import '../service/api_repository/db_repositories.dart';

class BasketButton extends StatefulWidget {
const  BasketButton({super.key, required this.productModel});
final  ProductModel productModel;

  @override
  State<BasketButton> createState() => _BasketButtonState();
}

class _BasketButtonState extends State<BasketButton> {

  ProductRepository productRepository = ProductRepository();


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.teal)),
          onPressed: () {
            context.read<CartBloc>().add(AddToCartEvent(widget.productModel));          },
          child: const Text("Add to Cart")),
    );
  }
}
