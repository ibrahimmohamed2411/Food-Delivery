import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final Widget? child;
  const CustomCard({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.5,
          ),
        ],
      ),
      child: child,
    );
  }
}
