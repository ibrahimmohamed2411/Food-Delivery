import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;
import 'package:food_delivery/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:food_delivery/features/orders/presentation/widgets/order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is OrdersErrorState) {
            return Center(
              child: Text(state.msg),
            );
          }
          if (state is OrdersLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return OrderItemWidget(orderItem: state.orders[index]);
              },
              itemCount: state.orders.length,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
