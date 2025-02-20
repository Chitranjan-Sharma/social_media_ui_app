import 'package:flutter/material.dart';
import 'package:social_media_ui_app/utils/my_theme.dart';
import 'package:social_media_ui_app/views/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
