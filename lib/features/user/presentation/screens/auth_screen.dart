import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/config/routes/app_routes.dart';
import 'package:food_delivery/core/utils/media_query_values.dart';
import 'package:food_delivery/core/widgets/custom_card.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/password_form_field.dart';
import '../bloc/user_bloc.dart';
import '../widgets/sign_in_widget.dart';
import '../widgets/sign_up_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: context.height * 0.94,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.5,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/auth_image.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        TabBar(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          indicatorColor: Colors.orange,
                          tabs: [
                            Tab(
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Sign - Up',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SignInWidget(),
                        // Text('Sign In'),
                        // Text('Sign Up'),
                        SignUpWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
