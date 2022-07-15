import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:food_delivery/features/orders/domain/entities/order.dart'
    as order;

class CustomOrderItem extends StatelessWidget {
  final order.Order orderItem;

  const CustomOrderItem({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: FittedBox(
        child: Row(
          children: [
            Text(DateFormat('yyyy-MM-dd – kk:mm').format(orderItem.orderDate)),
            SizedBox(
              width: 10,
            ),
            Text('Total= \EGP ${orderItem.orderPrice}'),
          ],
        ),
      ),
      children: orderItem.orderItems
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  trailing: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.title),
                  subtitle:
                      Text('${item.quantity.toString()} x \EGP ${item.price}'),
                ),
              ))
          .toList(),
    );
  }
}
