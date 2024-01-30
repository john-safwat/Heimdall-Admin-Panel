import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseState.dart';
import 'package:heimdalladmin/UI/AddModel/AddModelView.dart';
import 'package:heimdalladmin/UI/Models/LockModelNavigator.dart';
import 'package:heimdalladmin/UI/Models/LockModelViewModel.dart';
import 'package:provider/provider.dart';

class LockModelView extends StatefulWidget {

  static const String routeName = "LockModel";
  const LockModelView({super.key});

  @override
  State<LockModelView> createState() => _LockModelViewState();
}

class _LockModelViewState extends BaseState<LockModelView , LockModelViewModel> implements LockModelNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("Lock Model"),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.onFloatingActionButtonPress();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  LockModelViewModel initViewModel() {
    return LockModelViewModel();
  }

  @override
  goToAddModelScreen() {
    Navigator.pushNamed(context, AddModelView.routeName);
  }
}
