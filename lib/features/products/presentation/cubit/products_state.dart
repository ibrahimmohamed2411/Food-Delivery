part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}


class ProductsLoadedState extends ProductsState {
  final Products products;

  ProductsLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String msg;

  ProductsErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}




