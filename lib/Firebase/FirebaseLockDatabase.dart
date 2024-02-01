import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heimdalladmin/Models/Lock/Lock.dart';

FirebaseLockDatabase injectFirebaseLockDatabase(){
  return FirebaseLockDatabase.getInstance();
}

class FirebaseLockDatabase {

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;

  FirebaseLockDatabase._();
  static FirebaseLockDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseLockDatabase._();
  }

  CollectionReference<Lock> getCollectionReference(){
    return _firebaseStorage.collection("Locks").withConverter(
      fromFirestore: (snapshot, options) => Lock.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }

  Future<void> addLock({required Lock lock})async{
    await getCollectionReference().doc(lock.id).set(lock);
  }

}