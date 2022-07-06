import 'package:food_delivery/features/products/data/models/product_model.dart';
import 'package:food_delivery/features/products/domain/entities/products.dart';

class ProductsModel extends Products {
  ProductsModel.fromJson(List<Map<String, dynamic>> json) {
    for (var product in json) {
      if (product['category'] == 'food') {
        foodProducts.add(ProductModel.fromJson(product));
      } else if (product['category'] == 'drinks') {
        drinkProducts.add(ProductModel.fromJson(product));
      } else if (product['category'] == 'snacks') {
        snackProducts.add(ProductModel.fromJson(product));
      } else {
        sauceProducts.add(ProductModel.fromJson(product));
      }
    }
  }
}
