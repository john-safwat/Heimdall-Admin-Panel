import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/UI/Home/HomeTab/HomeTabNavigator.dart';

class HomeTabViewModel extends BaseViewModel <HomeTabNavigator> {

  goToHardwareComponentsScreen(){
    navigator!.goToHardwareComponentsScreen();
  }

  goToLockModelScreen(){
    navigator!.goToLockModelScreen();
  }
  goToRegisterLockScreen(){
    navigator!.goToRegisterLockScreen();
  }
  goToLocksScreen(){
    navigator!.goToLocksScreen();
  }

}