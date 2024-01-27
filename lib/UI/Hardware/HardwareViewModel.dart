
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareNavigator.dart';

class HardwareViewModel extends BaseViewModel<HardwareNavigator> {

  onFloatingActionButtonPress() {
    navigator!.goToAddComponentScreen();
  }
}
