import 'package:flutter/material.dart';
import '../../../../core/utils/media_query_values.dart';

import '../../../../core/utils/app_colors.dart';
class ItemNotFound extends StatelessWidget {
  const ItemNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_sharp,
            size: 120,
            color: AppColors.hint,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Item not found',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: context.width * 0.55,
            height: 50,
            child: Text(
              'Try searching the item with a different keyword.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
