part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final String msg;

  CartErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}

class CartLoadedState extends CartState {
  final List<Cart> cartItems;

  CartLoadedState({required this.cartItems});

  @override
  List<Object> get props => [cartItems];
}
