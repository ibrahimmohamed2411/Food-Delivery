import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../models/products_model.dart';
import '../../domain/entities/products.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getAllProducts();
  Stream<List<Product>> searchProducts(String query);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final FirebaseFirestore firestore;
  ProductsRemoteDataSourceImpl({required this.firestore});
  @override
  Future<ProductsModel> getAllProducts() async {
    final response = await firestore.collection('products').get();
    final List<Map<String, dynamic>> products = response.docs.map((doc) {
      return doc.data();
    }).toList();

    return ProductsModel.fromJson(products);
  }

  @override
  Stream<List<Product>> searchProducts(String query) {
    return firestore
        .collection('products')
        .where('title', isGreaterThanOrEqualTo: query.toString().toUpperCase())
        .snapshots()
        .map((products) {
      return products.docs
          .map((product) => ProductModel.fromJson(product.data()))
          .toList();
    });
  }
}
