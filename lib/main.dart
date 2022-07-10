import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app.dart';
import 'package:food_delivery/features/orders/data/models/order_model.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart';
import 'package:food_delivery/inject_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  // final order = OrderModel(
  //     orderDate: DateTime.now(),
  //     orderItems: [
  //       OrderItemModel(
  //         imageUrl:
  //             'https://firebasestorage.googleapis.com/v0/b/food-app-a79a5.appspot.com/o/pumpkin_soup.jpeg?alt=media&token=a43d8a0b-95ff-4d8a-9a57-4ba4943b33c6',
  //         price: 200,
  //         quantity: 3,
  //         title: 'Rice',
  //       ),
  //     ],
  //     orderPrice: 3000);
  // await FirebaseFirestore.instance
  //     .collection('orders')
  //     .doc(FirebaseAuth.instance.currentUser!.uid)
  //     .collection('personalOrders')
  //     .add(order.toJson());
  runApp(FoodDeliveryApp());
}
