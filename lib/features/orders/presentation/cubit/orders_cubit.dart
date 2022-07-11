import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/domain/entities/cart.dart';
import '../../domain/entities/order.dart';
import '../../domain/usecases/get_orders_usecase.dart';

import '../../../../core/usecases/usecase.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;

import '../../domain/usecases/make_order_usecase.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final MakeOrderUseCase makeOrderUseCase;
  OrdersCubit({required this.getOrdersUseCase, required this.makeOrderUseCase})
      : super(OrdersInitial());
  Future<void> getOrders() async {
    emit(OrdersLoadingState());

    final ordersOrFailure = await getOrdersUseCase(NoParams());
    emit(ordersOrFailure.fold(
      (failure) => OrdersErrorState(msg: failure.msg),
      (orders) => OrdersLoadedState(orders: orders),
    ));
  }

  Future<void> makeOrder(List<Cart> cartItems) async {
    final orderItem = Order(
      orderDate: DateTime.now(),
      orderItems: cartItems,
      orderPrice: cartItems.fold(
          0, (sum, cartItem) => sum + cartItem.price * cartItem.quantity),
    );

    final orderSuccessOrFailure =
        await makeOrderUseCase(OrderParams(orderItem: orderItem));
    orderSuccessOrFailure.fold(
      (failure) => emit(AddOrderErrorState(msg: failure.msg)),
      (success) {
        return emit(AddOrderSuccessState());
      },
    );
  }
}
