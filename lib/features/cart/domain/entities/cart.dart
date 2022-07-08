class Cart {
  final String productId;
  final String title;
  int quantity;
  final num price;
  final String imageUrl;
  Cart({
    required this.title,
    required this.price,
    required this.productId,
    required this.quantity,
    required this.imageUrl,
  });
}
