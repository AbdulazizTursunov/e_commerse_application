import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_product_by_id_event.dart';
part 'bloc_product_by_id_state.dart';

class ProductByIdBloc extends Bloc<ProductByIdEvent, ProductByIdState> {
  ProductByIdBloc() : super(ProductByIdInitial()) {
    on<ProductByIdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
