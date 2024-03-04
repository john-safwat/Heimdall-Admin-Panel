
import 'package:firebase_database/firebase_database.dart';

FirebaseLockRealtimeDatabase injectFirebaseLockRealtimeDatabase(){
  return FirebaseLockRealtimeDatabase.getInstance();
}


class FirebaseLockRealtimeDatabase {


  FirebaseLockRealtimeDatabase._();
  static FirebaseLockRealtimeDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseLockRealtimeDatabase._();
  }

  Future<void> addLockToDatabase({required String id})async{
     DatabaseReference firebaseStorage = FirebaseDatabase.instance.ref("Locks/$id");
     await firebaseStorage.set({
       "opened" : false,
       "lastImage" : "",
       "password":"1234",
       "y1_value" : 0,
       "y2_value" : 0,
       "x1_value" : 0,
       "x2_value" : 640,
       "request_update" : false,
       "alert_duration" : 300
     });
  }

  Future<void> deleteLock({required String id})async{
    DatabaseReference firebaseStorage = FirebaseDatabase.instance.ref("Locks/$id");
    await firebaseStorage.remove();
  }

}