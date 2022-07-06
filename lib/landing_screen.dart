import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/inject_container.dart';
import 'features/products/presentation/screens/products_screen.dart';
import 'features/user/data/datasources/user_local_data_source.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'features/user/presentation/screens/sign_in_screen.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is AuthenticationLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text('Loading....'),
              content: Text('..............'),
            ),
          );
        } else if (state is AuthenticationErrorState) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text(state.msg),
            ),
          );
        } else if (state is AuthenticationSuccessState) {
          Navigator.of(context).pop();
        } else if (state is ForgetPasswordSuccessState) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Success'),
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        body: StreamBuilder<User?>(
          stream: sl<UserLocalDataSource>().autoStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData && snapshot.data != null) {
              return ProductsScreen();
            }
            return SignInScreen();
          },
        ),
      ),
    );
  }
}
