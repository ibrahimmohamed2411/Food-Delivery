import 'package:flutter/material.dart';
import '../../data/datasources/products_remote_data_source.dart';
import '../../domain/entities/products.dart';
import '../widgets/product_item.dart';
import '../widgets/seperator_item.dart';

import '../../../../inject_container.dart';
import '../widgets/item_not_found.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  void showResults(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return StreamBuilder<List<Product>>(
        stream: sl<ProductsRemoteDataSource>().searchProducts(query),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.isEmpty) {
              return ItemNotFound();
            }
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final product = snapshot.data![index];
                return ProductItem(product: product);
              },
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => SeparatorItem(),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      );
    }
    return const SizedBox();
  }
}
