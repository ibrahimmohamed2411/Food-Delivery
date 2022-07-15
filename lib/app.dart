import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/firebase_messaging.dart';
import 'package:food_delivery/test_screen.dart';
import 'features/user/presentation/bloc/user_bloc.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/orders/presentation/cubit/orders_cubit.dart';
import 'features/user/presentation/screens/auth_screen.dart';
import 'inject_container.dart';

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => sl<UserBloc>(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        onGenerateRoute: AppRoutes().onGenerateRoute,
        // home: TestScreen(),

        // supportedLocales: AppLocalizationsSetup.supportedLocales,
        // localeResolutionCallback:
        //     AppLocalizationsSetup.localeResolutionCallback,
        // localizationsDelegates:
        //     AppLocalizationsSetup.localizationsDelegates,
        // locale: state.locale,
      ),
    );
  }
}
