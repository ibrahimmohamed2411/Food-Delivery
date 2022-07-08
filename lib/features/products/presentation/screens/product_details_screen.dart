import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_card.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../domain/entities/products.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(widget.product),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.product.title,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.product.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EGP ${widget.product.price * quantity}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[50],
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffECEDF1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: decrementQuantity,
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${quantity}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: incrementQuantity,
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.messenger_outline),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Any special requests?',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Add note',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.deepOrange,
                              ),
                              onPressed: () {
                                BlocProvider.of<CartCubit>(context)
                                    .addItem(widget.product, quantity);
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Add to cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'EGP ${widget.product.price * quantity}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void incrementQuantity() {
    setState(() {
      quantity = quantity + 1;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity = quantity - 1;
      });
    }
  }
}

Widget buildSliverAppBar(Product product) {
  return SliverAppBar(
    expandedHeight: 400,
    pinned: true,
    stretch: true,
    backgroundColor: Colors.deepOrange,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      // title: Text(
      //   product.title,
      //   style: const TextStyle(
      //     color: Colors.white,
      //   ),
      // ),
      background: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}
