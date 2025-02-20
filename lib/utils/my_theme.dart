import 'package:flutter/material.dart';
import 'package:social_media_ui_app/utils/color_constants.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: ColorConstants.white,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(

              //foregroundColor: WidgetStatePropertyAll(Colors.white),
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              overlayColor: WidgetStatePropertyAll(Colors.white),
              surfaceTintColor: WidgetStatePropertyAll(Colors.white))),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.white,
        scrolledUnderElevation: 0,
        titleTextStyle:
            TextStyle(color: ColorConstants.black, fontWeight: FontWeight.bold),
      ));
}
