import 'package:flutter/material.dart';
import 'package:food_delivery/features/user/data/datasources/user_local_data_source.dart';

import 'inject_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          child: Text('LogOut'),
          onPressed: () {
            sl<UserLocalDataSource>().signOut();
          },
        ),
      ),
    );
  }
}
