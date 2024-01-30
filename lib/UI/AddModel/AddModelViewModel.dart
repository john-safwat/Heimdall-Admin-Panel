import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseComponentsDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseImagesDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseModelsDatabase.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';
import 'package:heimdalladmin/UI/AddModel/AddModelNavigator.dart';

class AddModelViewModel extends BaseViewModel<AddModelNavigator> {

  PlatformFile? image;
  FilePickerResult? result;
  Model? model;
  FirebaseComponentsDatabase componentsDatabase =
      injectFirebaseComponentDatabase();
  FirebaseImagesDatabase imagesDatabase = injectFirebaseImagesDatabase();
  FirebaseModelsDatabase modelsDatabase = injectFirebaseModelsDatabase();

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  pickImage() async {
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: false
    );
    if (result != null) {
      image = result!.files.first;
    }
    notifyListeners();
  }

  // validation functions
  // validate on the name if it is not empty and doesn't contain ant spacial characters
  String? nameValidation(String name) {
    if (name.isEmpty) {
      return "Name Can't be Empty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return "Invalid Name";
    } else {
      return null;
    }
  }

  String? errorMessage;
  List<Component> components = [];
  List<Component> boards = [];
  List<Component> sensors = [];
  List<Component> cameras = [];
  List<Component> keypads = [];
  List<Component> locks = [];
  List<Component> selectedComponents = [];
  late Component selectedBoard;

  late Component selectedSensor;

  late Component selectedCamera;

  late Component selectedKeypad;

  late Component selectedLock;

  loadData() async {
    errorMessage = null;
    components = [];
    boards = [];
    sensors = [];
    cameras = [];
    keypads = [];
    locks = [];
    notifyListeners();
    try {
      components = await componentsDatabase.getComponents();
      boards = components.where((element) => element.type == "Board").toList();
      selectedBoard = boards.first;
      sensors =
          components.where((element) => element.type == "Sensor").toList();
      selectedSensor = sensors.first;
      cameras =
          components.where((element) => element.type == "Camera").toList();
      selectedCamera = cameras.first;
      keypads =
          components.where((element) => element.type == "Keypad").toList();
      selectedKeypad = keypads.first;
      locks = components.where((element) => element.type == "Lock").toList();
      selectedLock = locks.first;
      selectedComponents.add(selectedBoard);
      selectedComponents.add(selectedSensor);
      selectedComponents.add(selectedCamera);
      selectedComponents.add(selectedKeypad);
      selectedComponents.add(selectedLock);
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  // function to change the selected board
  changeSelectedBoard(Component component) {
    selectedBoard = component;
    selectedComponents.add(component);
    notifyListeners();
  }

  // function to change the selected board
  changeSelectedCamera(Component component) {
    selectedCamera = component;
    selectedComponents.add(component);
    notifyListeners();
  }

  // function to change the selected board
  changeSelectedSensor(Component component) {
    selectedSensor = component;
    selectedComponents.add(component);
    notifyListeners();
  }

  // function to change the selected board
  changeSelectedKeypad(Component component) {
    selectedKeypad = component;
    selectedComponents.add(component);
    notifyListeners();
  }

  // function to change the selected board
  changeSelectedLock(Component component) {
    selectedLock = component;
    selectedComponents.add(component);
    notifyListeners();
  }

  removeComponent(Component component) {
    selectedComponents.removeWhere((element) => element.id == component.id);
    notifyListeners();
  }

  onSavePress() async{
    bool have = false;
    for (int i = 0; i < selectedComponents.length; i++) {
      if (selectedComponents[i].type == "Board") {
        have = true;
        break;
      }
    }
    if(!have){
      navigator!.showMessage(message: "There is No Board in this Model" , posActionTitle: "ok");
      return;
    }

    for (int i = 0; i < selectedComponents.length; i++) {
      if (selectedComponents[i].type == "Sensor") {
        have = true;
        break;
      }
    }
    if(!have){
      navigator!.showMessage(message: "There is No Sensor in this Model" , posActionTitle: "ok");
      return;
    }

    if(image == null){
      navigator!.showMessage(message: "Pleas Pick Image" , posActionTitle: "ok");
      return;
    }

    if (formKey.currentState!.validate()){
      try {
        navigator!.showLoading(message: "Loading ...");
        String url = "";
        if (image != null) {
          url = await imagesDatabase.uploadImage(file: image!.bytes!);
        }
        await modelsDatabase.addModel(model: Model(
          name: nameController.text,
          image: url,
          components: selectedComponents,
          id: "",
        ));
        navigator!.goBack();
        navigator!.showMessage(message: "Model Added Successfully", posActionTitle: "ok" , posAction: goBack);
      } catch (e) {
        navigator!.goBack();
        navigator!.showMessage(message: e.toString(), posActionTitle: "ok");
      }
    }

  }

  goBack(){navigator!.goBack();}

}
