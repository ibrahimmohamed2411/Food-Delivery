import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_card.dart';
import '../widgets/menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: CupertinoColors.black,
                            child: const FlutterLogo(
                              size: 100,
                              style: FlutterLogoStyle.horizontal,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Ibrahim Mohamed',
                                style: TextStyle(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '01060250112',
                                style: TextStyle(color: Colors.blueGrey[200]),
                              ),
                              SizedBox(height: 15),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.5),
                                ),
                                child: const Text('Edit'),
                                onPressed: () {
                                  // Navigator.of(context)
                                  //     .pushNamed(AppRouter.editProfileScreen);
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomCard(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      MenuItem(
                          title: 'Location', icon: Icons.location_on_outlined),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      MenuItem(
                        title: 'Change Password',
                        icon: Icons.visibility_outlined,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      MenuItem(
                          title: 'Shipping', icon: Icons.car_rental_outlined),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      MenuItem(title: 'Payment', icon: Icons.payment_outlined),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Notification',
                      style: Theme.of(context).textTheme.headline3),
                ),
                SizedBox(height: 20),
                CustomCard(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      MenuItem(
                        title: 'App Notifications',
                        titleAtStart: true,
                        trailing: CupertinoSwitch(
                          value: false,
                          onChanged: (v) {},
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      MenuItem(
                        title: 'Location Tracking',
                        titleAtStart: true,
                        trailing: CupertinoSwitch(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (v) {},
                        ),
                      ),
                      MenuItem(
                        title: 'Dark Theme',
                        titleAtStart: true,
                        trailing: Switch.adaptive(
                          activeColor: Theme.of(context).primaryColor,
                          value: true,
                          onChanged: (v) {
                            // BlocProvider.of<ThemeCubit>(context).toggleTheme(v);
                          },
                        ),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Other',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomCard(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      MenuItem(
                        title: 'Language',
                        titleAtStart: true,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      MenuItem(
                        title: 'Currency',
                        titleAtStart: true,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
