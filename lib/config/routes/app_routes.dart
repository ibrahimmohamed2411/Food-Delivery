import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_delivery/features/cart/presentation/screens/cart_screen.dart';
import 'package:food_delivery/features/orders/presentation/screens/orders_screen.dart';
import 'package:food_delivery/features/products/presentation/screens/product_details_screen.dart';
import 'package:food_delivery/features/profile/presentation/screens/profile_screen.dart';
import 'package:food_delivery/features/user/presentation/screens/forget_password_screen.dart';
import 'package:food_delivery/features/user/presentation/screens/sign_up_screen.dart';
import 'package:food_delivery/landing_screen.dart';

import '../../features/orders/presentation/cubit/orders_cubit.dart';
import '../../features/products/domain/entities/products.dart';
import '../../inject_container.dart';

final cartCubit = sl<CartCubit>()..getCartItems();

class AppRoutes {
  static const String landingScreen = '/';
  static const String signUpScreen = '/signUp';
  static const String forgetPasswordScreen = '/forgetPassword';
  static const String cartScreen = '/cart-screen';
  static const String productDetailsScreen = '/product-details-screen';
  static const String ordersScreen = '/orders-screen';
  static const String profileScreen = '/profile-screen';
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
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<CartCubit>.value(
                value: cartCubit,
              ),
              BlocProvider<OrdersCubit>(
                create: (context) => sl<OrdersCubit>(),
              ),
            ],
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
      case ordersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<OrdersCubit>()..getOrders(),
            child: OrdersScreen(),
          ),
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );

      default:
        return null;
    }
  }
}
