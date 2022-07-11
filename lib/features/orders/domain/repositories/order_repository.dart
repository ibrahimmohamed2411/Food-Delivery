import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;

abstract class OrderRepository {
  Future<Either<Failure, List<order.Order>>> getOrders();
  Future<Either<Failure, Unit>> makeOrder(order.Order order);
}
