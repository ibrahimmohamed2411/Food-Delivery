import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../inject_container.dart';
import '../../../user/data/datasources/user_local_data_source.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined),
            title: Text(
              'Orders',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.ordersScreen);
            },
          ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(Icons.person_outline),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.profileScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              sl<UserLocalDataSource>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
