part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => <Object>[];
}



class ProductInitialEvent extends ProductEvent {
  const ProductInitialEvent({required this.productId});

  final String productId;

  @override
  List<Object> get props => <Object>[productId];
}
