import 'package:animation/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:mobx/mobx.dart';
part 'HomePageModel.g.dart';

class HomePageModel = _HomePageModelBase with _$HomePageModel, NavigationMixin;

abstract class _HomePageModelBase with Store {
  
}