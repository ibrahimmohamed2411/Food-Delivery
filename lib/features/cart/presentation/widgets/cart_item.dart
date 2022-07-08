import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/presentation/cubit/cart_cubit.dart';

import '../../domain/entities/cart.dart';

class CartItem extends StatefulWidget {
  final Cart cart;
  CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.cart.productId),
      direction: DismissDirection.startToEnd,
      background: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 35,
      ),
      onDismissed: (direction) {
        BlocProvider.of<CartCubit>(context).deleteCartItem(widget.cart);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Item Deleted successfully'),
        //     duration: Duration(seconds: 1),
        //   ),
        // );
      },
      child: SizedBox(
        height: 130,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          tileColor: Colors.white70,
          title: Text(
            widget.cart.title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              widget.cart.imageUrl,
              fit: BoxFit.fill,
              // height: 100,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EGP ${widget.cart.price * widget.cart.quantity}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        BlocProvider.of<CartCubit>(context)
                            .decrementCartItemQuantity(widget.cart);
                      });
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    widget.cart.quantity.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        BlocProvider.of<CartCubit>(context)
                            .incrementCartItemQuantity(widget.cart);
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
