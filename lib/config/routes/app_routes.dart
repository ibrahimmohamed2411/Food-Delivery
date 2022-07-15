import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/orders/presentation/screens/orders_screen.dart';
import '../../features/products/presentation/screens/product_details_screen.dart';
import '../../features/products/presentation/screens/products_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/user/presentation/screens/forget_password_screen.dart';
import '../../landing_screen.dart';

import '../../features/orders/presentation/cubit/orders_cubit.dart';
import '../../features/products/domain/entities/products.dart';
import '../../inject_container.dart';

final cartCubit = sl<CartCubit>()..getCartItems();

class AppRoutes {
  static const String landingScreen = '/';
  static const String forgetPasswordScreen = '/forgetPassword';
  static const String cartScreen = '/cart-screen';
  static const String productDetailsScreen = '/product-details-screen';
  static const String ordersScreen = '/orders-screen';
  static const String profileScreen = '/profile-screen';
  static const String productsScreen = '/products-screen';
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(
          builder: (context) => LandingScreen(),
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
      case productsScreen:
        return MaterialPageRoute(
          builder: (context) => ProductsScreen(),
        );

      default:
        return null;
    }
  }
}
