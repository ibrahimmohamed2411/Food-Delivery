// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  final List<Order> orders;

  OrdersLoadedState({required this.orders});

  @override
  List<Object> get props => [orders];
}

class OrdersErrorState extends OrdersState {
  final String msg;

  OrdersErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}

class AddOrderSuccessState extends OrdersState {}

class AddOrderErrorState extends OrdersState {
  final String msg;
  AddOrderErrorState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
