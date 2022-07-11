import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/media_query_values.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, context.height * 0.22, 60, 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_order_image.png',
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No orders yet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Hit the orange button down below to Create an order',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomElevatedButton(
              label: 'Create an order',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
