import 'package:bloc/bloc.dart';
import 'package:e_commerse_application/data/local_db/local_sql.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'local_db_event.dart';
import 'local_db_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
    on<GetCartEvent>(_getCart);
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    await LocalDatabase().insertProduct(event.product);
  }

  void _removeFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    await LocalDatabase().deleteProductByID(event.productId);
  }

  void _getCart(GetCartEvent event, Emitter<CartState> emit) async {
    var cart = await LocalDatabase().getAllProducts();
    emit(CartLoadedState(cart));
  }
}
