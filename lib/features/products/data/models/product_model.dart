import '../../domain/entities/products.dart';

class ProductModel extends Product {
  ProductModel(
      {required String id,
      required String title,
      required String description,
      required num price,
      required String imageUrl,
      required num discount,
      required String category})
      : super(
            id: id,
            title: title,
            description: description,
            price: price,
            imageUrl: imageUrl,
            discount: discount,
            category: category);
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json['title'],
        id: json['id'],
        discount: json['discount'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        description: json['description'],
        category: json['category'],
      );
}
