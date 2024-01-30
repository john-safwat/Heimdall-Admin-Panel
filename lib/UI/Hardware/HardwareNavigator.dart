import 'package:heimdalladmin/Base/BaseNavigator.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';

abstract class HardwareNavigator extends BaseNavigator {

  goToAddComponentScreen();
  goToAddComponentScreenWithData(Component component);

}