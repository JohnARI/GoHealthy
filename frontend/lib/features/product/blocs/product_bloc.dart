import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/api_exceptions.dart';
import '../data/models/product.dart';
import '../data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository = ProductRepository();
  ProductBloc() : super(ProductInitialState()) {
    on<ProductInitialEvent>(_handleProductInitialEvent);
  }

  FutureOr<void> _handleProductInitialEvent(
      ProductInitialEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoadingState());
      final Product product =
          await _productRepository.getProducts(event.productId);
      emit(ProductSuccessState(product: product));
    } catch (error) {
      if (error is APIException) {
        emit(ProductErrorState(message: error.message));
        return;
      }
      log(name: 'ProductBloc', 'error: $error');
      rethrow;
    }
  }
}
