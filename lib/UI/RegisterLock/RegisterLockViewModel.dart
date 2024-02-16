import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseLockAuthDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseLockDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseLockRealtimeDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseModelsDatabase.dart';
import 'package:heimdalladmin/Models/Lock/Lock.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/UI/RegisterLock/RegisterLockNavigator.dart';
import 'package:randomstring_dart/randomstring_dart.dart';

class RegisterLockViewModel extends BaseViewModel<RegisterLockNavigator>{

  FirebaseModelsDatabase modelsDatabase = injectFirebaseModelsDatabase();
  FirebaseLockAuthDatabase authDatabase = injectFirebaseLockAuthDatabase();
  FirebaseLockDatabase lockDatabase = injectFirebaseLockDatabase();
  FirebaseLockRealtimeDatabase lockRealtimeDatabase = injectFirebaseLockRealtimeDatabase();

  String? errorMessage;
  List<Model> models = [];
  late Model selectedModel;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  loadData()async{
    emailController.text = "${createRandomNumber()}@heimdall.com";
    passwordController.text = "123123123";
    errorMessage = null ;
    models = [];
    notifyListeners();
    try{
      models = await modelsDatabase.getModels();
      selectedModel = models.first;
      notifyListeners();
    }catch (e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // function to add random string
  String createRandomNumber(){
    return RandomString().getRandomString(
        lowersCount: 0 ,
        numbersCount: 10,
        specialsCount: 0,
        uppersCount: 0,
        canSpecialRepeat: false,
        specials: "",
    );
  }

  // validation functions

  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "Email Can't be Empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "Invalid Email";
    }
    return null;
  }

  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "Password Can't be Empty";
    } else if (input.length < 8) {
      return "Invalid Password";
    }
    return null;
  }

  changeSelectedModel(Model model){
    selectedModel = model;
    notifyListeners();
  }

  onSavePress()async{
    if(formKey.currentState!.validate()){
      try{
        navigator!.showLoading(message: "Loading...");
        Lock lock = Lock(
            id: "",
            email: emailController.text,
            password: passwordController.text,
            firstOwner: "",
            model: selectedModel.id!,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            images: []);

        User response = await authDatabase.createLock(lock: lock);
        lock.id = response.uid;
        await lockDatabase.addLock(lock: lock);
        await lockRealtimeDatabase.addLockToDatabase(id: lock.id);
        navigator!.goBack();
        navigator!.showMessage(message: "Lock Added Successfully", posActionTitle: "ok" , posAction: goBack);
      }catch (e){
        debugPrint(e.toString());
        navigator!.goBack();
        navigator!.showMessage(message: e.toString(), posActionTitle: "ok");
      }
    }
  }

  goBack(){navigator!.goBack();}

}