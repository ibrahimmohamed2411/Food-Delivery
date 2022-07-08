import 'package:flutter/material.dart';
import 'package:food_delivery/config/routes/app_routes.dart';
import 'package:food_delivery/core/utils/media_query_values.dart';

import '../../domain/entities/products.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.productDetailsScreen, arguments: product);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 130,
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width * 0.63,
                  child: Text(
                    product.title,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Color.fromARGB(255, 53, 49, 49),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'EGP ${product.price}',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Positioned(
            top: 18,
            left: context.width * 0.70,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(product.imageUrl),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
