// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:food_delivery/features/orders/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders();
  Future<Unit> makeOrder(OrderModel order);
}

class OrderRemoteDataSourceImp implements OrderRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  OrderRemoteDataSourceImp({
    required this.firebaseAuth,
    required this.firestore,
  });
  @override
  Future<List<OrderModel>> getOrders() async {
    final orderItems = await firestore
        .collection('orders')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('personalOrders')
        .orderBy('orderDate', descending: true)
        .get();
    debugPrint(orderItems.size.toString());
    return orderItems.docs
        .map((orderItem) => OrderModel.fromJson(orderItem.data()))
        .toList();
  }

  @override
  Future<Unit> makeOrder(OrderModel order) async {
    await firestore
        .collection('orders')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('personalOrders')
        .add(order.toJson());
    return Future.value(unit);
  }
}
