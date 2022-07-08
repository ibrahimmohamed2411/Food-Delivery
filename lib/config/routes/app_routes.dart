import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_delivery/features/cart/presentation/screens/cart_screen.dart';
import 'package:food_delivery/features/products/presentation/screens/product_details_screen.dart';
import 'package:food_delivery/features/user/presentation/screens/forget_password_screen.dart';
import 'package:food_delivery/features/user/presentation/screens/sign_up_screen.dart';
import 'package:food_delivery/landing_screen.dart';

import '../../features/products/domain/entities/products.dart';
import '../../inject_container.dart';

final cartCubit = sl<CartCubit>()..getCartItems();

class AppRoutes {
  static const String landingScreen = '/';
  static const String signUpScreen = '/signUp';
  static const String forgetPasswordScreen = '/forgetPassword';
  static const String cartScreen = '/cart-screen';
  static const String productDetailsScreen = '/product-details-screen';
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(
          builder: (context) => LandingScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case cartScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cartCubit,
            child: CartScreen(),
          ),
        );
      case productDetailsScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cartCubit,
            child: ProductDetailsScreen(
              product: product,
            ),
          ),
        );

      default:
        return null;
    }
  }
}
