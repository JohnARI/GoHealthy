part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => <Object>[];
}

final class ProductInitialState extends ProductState {
}

final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  const ProductSuccessState({required this.product});

  final Product product;

  @override
  List<Object> get props => <Object>[product];
}

final class ProductErrorState extends ProductState {
  const ProductErrorState({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
