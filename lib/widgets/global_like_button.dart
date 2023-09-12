import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'package:e_commerse_application/service/api_repository/db_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../bloc/favorites_bloc/favorite_bloc.dart';
import '../bloc/favorites_bloc/favorite_event.dart';
import '../ui/tab_box/all_product_page/product_page.dart';



class GlobalLikeButton extends StatefulWidget {
  const GlobalLikeButton({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<GlobalLikeButton> createState() => _GlobalLikeButtonState();
}

class _GlobalLikeButtonState extends State<GlobalLikeButton>{
 ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 30,
      circleColor: const CircleColor(
          start: Color(0xff00ddff),
          end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked
              ? Colors.teal
              : Colors.grey,
          size: 30,
        );
      },
      onTap: (selected) async {
        print("ontapga kirdi");
        ProductsPage.product = widget.product;
        print("ontapga ${widget.product}");
        print("ontapga ${ProductsPage.product}");
        BlocProvider.of<FavoritesBloc>(context).add(AddToFavoritesEvent(widget.product));
        Fluttertoast.showToast(
          msg: "Favoritlarga qo'shildi",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP_LEFT,
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );

        setState(() {
          selected != selected;
        });
        selected ? true : false;
        return !selected;
      },
    );

  }
}

