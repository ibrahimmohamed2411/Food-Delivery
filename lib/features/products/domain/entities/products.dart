class Products {
  List<Product> foodProducts = [];
  List<Product> drinkProducts = [];
  List<Product> snackProducts = [];
  List<Product> sauceProducts = [];
}

class Product {
  String id;
  String title;
  String description;
  num price;
  String imageUrl;
  num discount;
  String category;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.discount,
    required this.category,
  });
}
