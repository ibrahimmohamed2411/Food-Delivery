import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/app_colors.dart';
import '../utils/media_query_values.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  const CustomElevatedButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor ?? AppColors.importantColor,
          elevation: 500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
