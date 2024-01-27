import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/UI/AddComponent/AddHardwareComponentView.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareNavigator.dart';
import 'package:heimdalladmin/UI/Hardware/HardwareViewModel.dart';
import 'package:provider/provider.dart';

class HardwareView extends StatefulWidget {
  static const String routeName = "Hardware";
  const HardwareView({super.key});

  @override
  State<HardwareView> createState() => _HardwareViewState();
}

class _HardwareViewState extends BaseState<HardwareView , HardwareViewModel> implements HardwareNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hardware Components"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { viewModel.onFloatingActionButtonPress(); },
          child:const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  HardwareViewModel initViewModel() {
    return HardwareViewModel();
  }

  @override
  goToAddComponentScreen() {
    Navigator.pushNamed(context, AddHardwareView.routeName);
  }

}
