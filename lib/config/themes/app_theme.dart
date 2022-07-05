import 'package:flutter/material.dart';
import '../../core/utils/app_strings.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    // primaryColor: AppColors.primary,

    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    // appBarTheme: AppBarTheme(
    //   centerTitle: true,
    //   color: Colors.transparent,
    //   elevation: 0,
    //   titleTextStyle: TextStyle(
    //     color: Colors.black,
    //     fontSize: 20,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
    // fontFamily: AppStrings.fontFamily,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        // ! for sign in and sign up
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        //!for forget password and other fields like that
        fontSize: 20,
        color: Colors.blueAccent,
      ),
      bodyMedium: TextStyle(
        //! for grey keywords in app
        fontSize: 17,
        color: Colors.grey,
      ),
      titleSmall: TextStyle(
        //! sign in an sign up elevated buttons
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
