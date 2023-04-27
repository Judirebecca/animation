import 'package:animation/Helpers/NavigationHelper/Routes.dart';
import 'package:animation/Pages/HomePage/HomePageModel.dart';

import '../../Helpers/NavigationHelper/Mixin/NavigationMixin.dart';

class HomePageVM extends HomePageModel{
   void navigationtosecondpage(){
    navigationStream.add(NavigatorPush(pageConfig: Pages.secondPageConfig, data: null));
  }
}