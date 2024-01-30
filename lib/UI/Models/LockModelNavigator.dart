import 'package:heimdalladmin/Base/BaseNavigator.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';

abstract class LockModelNavigator extends BaseNavigator {

  goToAddModelScreen();
  goToAddModelScreenWithData(Model model);


}