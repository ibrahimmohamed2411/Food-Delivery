import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/presentation/widgets/cart_item.dart';
import 'package:food_delivery/features/products/presentation/widgets/seperator_item.dart';

import '../cubit/cart_cubit.dart';
import '../widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is CartLoadedState) {
            if (state.cartItems.isEmpty) {
              return EmptyCart();
            }
            return ListView.separated(
              itemBuilder: (context, index) =>
                  CartItem(cart: state.cartItems[index]),
              itemCount: state.cartItems.length,
              separatorBuilder: (context, index) => SeparatorItem(),
            );
          } else if (state is CartErrorState) {
            return Center(
              child: Text(state.msg),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
