import '../../../cart/data/models/cart_model.dart';
import '../../domain/entities/order.dart';

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


