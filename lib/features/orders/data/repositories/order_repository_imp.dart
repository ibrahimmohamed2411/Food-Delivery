// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/features/cart/data/models/cart_model.dart';
import 'package:food_delivery/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:food_delivery/features/orders/data/models/order_model.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;

import 'package:food_delivery/features/orders/domain/repositories/order_repository.dart';

class OrderRepositoryImp implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;
  OrderRepositoryImp({
    required this.orderRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<order.Order>>> getOrders() async {
    try {
      final orderItems = await orderRemoteDataSource.getOrders();
      return Right(orderItems);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(msg: e.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> makeOrder(order.Order order) async {
    try {
      final OrderModel orderModel = OrderModel(
        orderDate: order.orderDate,
        orderItems: order.orderItems
            .map(
              (e) => CartModel(
                  title: e.title,
                  price: e.price,
                  productId: e.productId,
                  quantity: e.quantity,
                  imageUrl: e.imageUrl),
            )
            .toList(),
        orderPrice: order.orderPrice,
      );
      await orderRemoteDataSource.makeOrder(orderModel);
      return Right(unit);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }
}
