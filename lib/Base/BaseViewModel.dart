import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseNavigator.dart';
import 'package:heimdalladmin/Providers/AppConfigProvider.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {

  N? navigator;
  AppConfigProvider? appConfigProvider;

}