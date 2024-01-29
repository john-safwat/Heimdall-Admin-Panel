import 'package:flutter/material.dart';

abstract class BaseNavigator {

  showLoading({
    required String message
  });

  showMessage({
    required String message ,
    String? posActionTitle ,
    VoidCallback? posAction,
    String? negativeActionTitle,
    VoidCallback? negativeAction
  });

  goBack();

}