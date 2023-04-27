import 'package:animation/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:mobx/mobx.dart';
part 'SecondPageModel.g.dart';

class SecondPageModel = _SecondPageModelBase with _$SecondPageModel, NavigationMixin;

abstract class _SecondPageModelBase with Store {
  
}