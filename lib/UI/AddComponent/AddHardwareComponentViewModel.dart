
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseComponentsDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseImagesDatabase.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentNavigator.dart';

class AddHardwareComponentViewModel
    extends BaseViewModel <AddHardwareComponentNavigator> {

  PlatformFile? image;
  FilePickerResult? result;
  Component? component;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController costController = TextEditingController();

  List<String> types = ["Board", "Camera", "Sensor" , "Keypad" , "Lock"];
  String selectedType = "Board";

  FirebaseImagesDatabase imagesDatabase = injectFirebaseImagesDatabase();
  FirebaseComponentsDatabase componentsDatabase = injectFirebaseComponentDatabase();

  initControllers(Component component){
    this.component = component;
    nameController.text = component.name;
    descriptionController.text = component.description;
    costController.text = component.cost.toString();
    selectedType = component.type;
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

  String? descriptionValidation(String value) {
    if (value.isEmpty) {
      return "Invalid Description";
    }
    return null;
  }


  String? costValidation(String value) {
    if (value.isEmpty) {
      return "Invalid Cost";
    }
    return null;
  }

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

  changeSelectedType(String type) {
    selectedType = type;
    notifyListeners();
  }

  onSavePress(){
    if(component != null){
      updateComponent();
    }else {
      addComponent();
    }
  }

  addComponent() async {
    if (formKey.currentState!.validate()) {
      try {
        navigator!.showLoading(message: "Loading ...");
        String url = "";
        if (image != null) {
          url = await imagesDatabase.uploadImage(file: image!.bytes!);
        }
        await componentsDatabase.addComponent(component: Component(id: "",
            name: nameController.text,
            description: descriptionController.text,
            type: selectedType,
            image: url,
            cost: double.parse(costController.text)));
        navigator!.goBack();
        navigator!.showMessage(message: "Component Added Successfully", posActionTitle: "ok" , posAction: goBack);
      } catch (e) {
        navigator!.goBack();
        navigator!.showMessage(message: e.toString(), posActionTitle: "ok");
      }
    }
  }

  updateComponent()async{
    if (formKey.currentState!.validate()) {
      try {
        navigator!.showLoading(message: "Loading ...");
        if (image != null) {
          await imagesDatabase.updateImage(file: image!.bytes! , url: component!.image);
        }
        component!.name = nameController.text;
        component!.description = descriptionController.text;
        component!.type = selectedType;
        component!.cost = double.parse(costController.text);
        await componentsDatabase.updateComponent(component: component!);
        navigator!.goBack();
        navigator!.showMessage(message: "Component Updated Successfully", posActionTitle: "ok" , posAction: goBack);
      } catch (e) {
        navigator!.goBack();
        navigator!.showMessage(message: e.toString(), posActionTitle: "ok");
      }
    }
  }

  goBack(){
    navigator!.goBack();
  }

}