
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseComponentsDatabase.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareNavigator.dart';

class HardwareViewModel extends BaseViewModel<HardwareNavigator> {

  FirebaseComponentsDatabase database = injectFirebaseComponentDatabase();
  List<Component> components = [];

  onFloatingActionButtonPress() {
    navigator!.goToAddComponentScreen();
  }

  goToAddHardwareScreen(Component component){
    navigator!.goToAddComponentScreenWithData(component);
  }
}
