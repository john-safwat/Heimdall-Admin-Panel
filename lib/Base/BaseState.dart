
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseNavigator.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget , VM extends BaseViewModel> extends State<T> implements BaseNavigator {

  // the view model this object will be the
  late VM viewModel;
  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
    viewModel.appConfigProvider = Provider.of<AppConfigProvider>(context , listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
    viewModel.appConfigProvider =null;
  }

}
