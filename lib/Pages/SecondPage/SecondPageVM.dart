import '../../Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'SecondPageModel.dart';

class SecondPageVM extends SecondPageModel{
  void navigationtohomepage() {

    navigationStream.add(NavigatorPop());
  }
}