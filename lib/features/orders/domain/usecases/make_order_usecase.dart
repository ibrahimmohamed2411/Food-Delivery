// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;
import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/orders/domain/repositories/order_repository.dart';

class MakeOrderUseCase implements UseCase<Unit, OrderParams> {
  final OrderRepository orderRepository;
  MakeOrderUseCase({
    required this.orderRepository,
  });
  @override
  Future<Either<Failure, Unit>> call(OrderParams params) async {
    return await orderRepository.makeOrder(params.orderItem);
  }
}

class OrderParams extends Equatable {
  final order.Order orderItem;

  OrderParams({required this.orderItem});
  @override
  List<Object> get props => [orderItem];
}
