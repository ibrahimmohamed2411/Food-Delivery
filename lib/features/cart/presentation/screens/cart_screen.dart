import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../widgets/cart_item.dart';
import '../../../orders/presentation/cubit/orders_cubit.dart';
import '../../../products/presentation/widgets/seperator_item.dart';

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
            return Stack(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) =>
                      CartItem(cart: state.cartItems[index]),
                  itemCount: state.cartItems.length,
                  separatorBuilder: (context, index) => SeparatorItem(),
                ),
                Positioned(
                  top: context.height * 0.75,
                  right: context.width * 0.1,
                  left: context.width * 0.1,
                  child: CustomElevatedButton(
                    label: 'Order Now',
                    onPressed: () {
                      BlocProvider.of<OrdersCubit>(context)
                          .makeOrder(state.cartItems);
                    },
                  ),
                ),
                BlocListener<OrdersCubit, OrdersState>(
                  listener: (context, state) {
                    if (state is AddOrderSuccessState) {
                      BlocProvider.of<CartCubit>(context).clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Your Order has been placed'),
                        ),
                      );
                    }
                    if (state is AddOrderErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Ann Error Occurred!!'),
                        ),
                      );
                    }
                  },
                  child: SizedBox(),
                ),
              ],
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
