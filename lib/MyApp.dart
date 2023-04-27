import 'package:animation/Pages/HomePage/HomePage.dart';
import 'package:flutter/material.dart';

import 'Helpers/NavigationHelper/NavigationHelper.dart';
import 'Helpers/NavigationHelper/Routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 229, 245, 2),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute(initialPage: Pages.homePageConfig, initialPageData: null).onGenerateRoute,
    );
  }
}