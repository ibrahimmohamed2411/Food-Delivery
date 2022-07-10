import 'package:food_delivery/features/cart/data/models/cart_model.dart';
import 'package:food_delivery/features/cart/domain/entities/cart.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel(
      {required DateTime orderDate,
      required List<CartModel> orderItems,
      required num orderPrice})
      : super(
            orderDate: orderDate,
            orderItems: orderItems,
            orderPrice: orderPrice);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderDate: DateTime.parse(json['orderDate']),
      orderItems: List<CartModel>.from(
        json["orderItems"].map<CartModel>(
          (x) => CartModel.fromJson(x),
        ),
      ),
      orderPrice: json['orderPrice'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'orderDate': orderDate.toIso8601String(),
      'orderPrice': orderPrice,
      'orderItems':
          orderItems.map((item) => (item as CartModel).toJson()).toList(),
    };
  }
}

// class OrderItemModel extends OrderItem {
//   OrderItemModel(
//       {required String imageUrl,
//       required num price,
//       required int quantity,
//       required String title})
//       : super(
//             imageUrl: imageUrl, price: price, quantity: quantity, title: title);
//   factory OrderItemModel.fromJson(Map<String, dynamic> json) {
//     return OrderItemModel(
//       imageUrl: json['imageUrl'] as String,
//       price: json['price'] as num,
//       quantity: json['quantity'] as int,
//       title: json['title'] as String,
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'imageUrl': imageUrl,
//       'price': price,
//       'quantity': quantity,
//       'title': title,
//     };
//   }
// }
