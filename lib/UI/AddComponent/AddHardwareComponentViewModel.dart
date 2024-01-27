import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentNavigator.dart';

class AddHardwareComponentViewModel extends BaseViewModel <AddHardwareComponentNavigator> {

  PlatformFile? image;
  FilePickerResult? result;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController costController = TextEditingController();

  List<String> types = ["Board" , "Camera" , "Sensor"];
  String selectedType = "Board";

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
    if(value.isEmpty){
      return "Invalid Description";
    }
    return null;
  }


  String? costValidation(String value) {
    if(value.isEmpty){
      return "Invalid Cost";
    }
    return null;
  }

  pickImage()async{
    result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowMultiple: false
    );
    if(result != null){
      image = result!.files.first;
    }
    notifyListeners();
  }

  changeSelectedType(String type){
    selectedType = type;
    notifyListeners();
  }

}