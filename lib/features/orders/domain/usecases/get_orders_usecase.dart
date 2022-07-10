// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;
import 'package:food_delivery/features/orders/domain/repositories/order_repository.dart';

class GetOrdersUseCase implements UseCase<List<order.Order>, NoParams> {
  final OrderRepository orderRepository;
  GetOrdersUseCase({
    required this.orderRepository,
  });
  @override
  Future<Either<Failure, List<order.Order>>> call(NoParams params) async {
    return await orderRepository.getOrders();
  }
}
