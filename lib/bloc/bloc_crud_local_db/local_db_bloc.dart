import 'package:bloc/bloc.dart';
import 'package:e_commerse_application/data/local_db/local_sql.dart';
import 'package:e_commerse_application/data/model/product_model/product_model.dart';
import 'local_db_event.dart';
import 'local_db_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  List<ProductModel> cart = [];

  CartBloc() : super(CartInitialState()){
    on<CartEvent>(localDbCrud);
  }

  @override
  Stream<CartState> localDbCrud(CartEvent event, Emitter emit) async* {
    if (event is AddToCartEvent) {
      // "Add to Cart" tugmasi bosildi, LocalDatabase orqali ma'lumotni saqlash
      await LocalDatabase().insertProduct(event.product);
      cart.add(event.product);
    } else if (event is RemoveFromCartEvent) {
      // "Remove from Cart" tugmasi bosildi, ma'lumotni o'chirish
      await LocalDatabase().deleteProductByID(event.productId);
      cart.removeWhere((product) => product.id == event.productId);
    } else if (event is GetCartEvent) {
      // "Cart" ma'lumotlarini olish
      cart = await LocalDatabase().getAllProducts();
    }
    // State-ni yangilang
    yield CartLoadedState(List.from(cart));
  }
}