import '../../../cart/domain/entities/cart.dart';

class Order {
  final DateTime orderDate;
  final num orderPrice;
  final List<Cart> orderItems;

  Order({
    required this.orderDate,
    required this.orderItems,
    required this.orderPrice,
  });
}

// class OrderItem {
//   final String imageUrl;
//   final num price;
//   final int quantity;
//   final String title;

//   OrderItem({
//     required this.imageUrl,
//     required this.price,
//     required this.quantity,
//     required this.title,
//   });
// }
