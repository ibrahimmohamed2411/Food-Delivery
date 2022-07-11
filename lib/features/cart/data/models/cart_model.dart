import '../../domain/entities/cart.dart';

class CartModel extends Cart {
  CartModel(
      {required String title,
      required num price,
      required String productId,
      required int quantity,
      required String imageUrl})
      : super(
            title: title,
            price: price,
            productId: productId,
            quantity: quantity,
            imageUrl: imageUrl);

  bool equals(CartModel cartModel) {
    if (productId == cartModel.productId) {
      return true;
    }
    return false;
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
