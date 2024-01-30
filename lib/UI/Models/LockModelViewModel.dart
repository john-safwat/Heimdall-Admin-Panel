import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/UI/Models/LockModelNavigator.dart';

class LockModelViewModel extends BaseViewModel<LockModelNavigator> {

  onFloatingActionButtonPress(){
    navigator!.goToAddModelScreen();
  }

}