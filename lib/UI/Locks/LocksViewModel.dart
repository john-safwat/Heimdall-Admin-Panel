import 'package:flutter/material.dart';
import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/Firebase/FirebaseLockAuthDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseLockDatabase.dart';
import 'package:heimdalladmin/Firebase/FirebaseLockRealtimeDatabase.dart';
import 'package:heimdalladmin/Models/Lock/Lock.dart';
import 'package:heimdalladmin/UI/Locks/LocksNavigator.dart';

class LocksViewModel extends BaseViewModel<LocksNavigator> {
  FirebaseLockDatabase lockDatabase = injectFirebaseLockDatabase();
  FirebaseLockAuthDatabase authDatabase = injectFirebaseLockAuthDatabase();
  FirebaseLockRealtimeDatabase lockRealtimeDatabase =
      injectFirebaseLockRealtimeDatabase();

  String? errorMessage;
  List<Lock> locks = [];

  loadData() async {
    errorMessage = null;
    locks = [];
    notifyListeners();

    try {
      locks = await lockDatabase.getLocks();
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      print(e);
      notifyListeners();
    }
  }

  onCardClick({required Lock lock}) {
    navigator!.showMessage(
        message: "Are You Sure To Delete",
        posActionTitle: "ok",
        posAction: () {
          deleteLock(lock: lock);
        },
        negativeActionTitle: "Cancel");
  }

  deleteLock({required Lock lock}) async {
    try {
      navigator!.showLoading(message: "Loading ... ");
      await authDatabase.deleteAccount(lock: lock);
      await lockDatabase.deleteLock(id: lock.id);
      await lockRealtimeDatabase.deleteLock(id: lock.id);
      navigator!.goBack();
      navigator!.showMessage(
          message: "Lock Deleted Successfully", posActionTitle: "ok" , posAction: (){navigator!.goBack();});
    } catch (e) {
      navigator!.goBack();
      navigator!.showMessage(
          message: "Lock Deleted Successfully", posActionTitle: "ok");
    }
  }
}
