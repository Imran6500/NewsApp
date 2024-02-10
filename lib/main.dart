import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Config/theme.dart';
import 'Controllers/homePageController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePageController());
  }
}
