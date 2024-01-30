import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseModelsDatabase.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/UI/Models/LockModelNavigator.dart';

class LockModelViewModel extends BaseViewModel<LockModelNavigator> {

  FirebaseModelsDatabase database = injectFirebaseModelsDatabase();

  List<Model> models = [];

  onFloatingActionButtonPress(){
    navigator!.goToAddModelScreen();
  }


  goToAddHardwareScreen(Model model){
    navigator!.goToAddModelScreenWithData(model);
  }

}