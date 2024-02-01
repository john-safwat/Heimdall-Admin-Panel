import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heimdalladmin/Models/Lock/Lock.dart';

FirebaseLockAuthDatabase injectFirebaseLockAuthDatabase(){
  return FirebaseLockAuthDatabase.getInstance();
}

class FirebaseLockAuthDatabase{

  // singleton pattern
  FirebaseLockAuthDatabase._();
  static FirebaseLockAuthDatabase? _instance ;

  static FirebaseLockAuthDatabase getInstance(){
    return _instance??=FirebaseLockAuthDatabase._();
  }

  final _firebase = FirebaseAuth.instance;

  // function to create user in firebase auth
  Future<User> createLock({required Lock lock}) async {
    await _firebase.createUserWithEmailAndPassword(
        email: lock.email,
        password: lock.password);
    return _firebase.currentUser!;
  }

  Future<void>deleteAccount({required Lock lock})async{
    var response = await _firebase.signInWithEmailAndPassword(email: lock.email, password: lock.password);
    await response.user!.delete();
  }

}