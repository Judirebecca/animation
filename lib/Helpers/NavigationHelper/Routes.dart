// ignore_for_file: constant_identifier_names, unused_import

import 'package:animation/Pages/HomePage/HomePage.dart';
import '../../Pages/Secondpage/SecondPage.dart';
import 'NavigationHelper.dart';

enum Routes {
  HomePage,
  SecondPage,
}

class Pages {
  Object? data;
  static final PageConfig homePageConfig = PageConfig(
      route: Routes.HomePage, build: (context) => const HomePage());
  static final PageConfig secondPageConfig = PageConfig(
      route: Routes.SecondPage, build: (context) => const SecondPage());
}
