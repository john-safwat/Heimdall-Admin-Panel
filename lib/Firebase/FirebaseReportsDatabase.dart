import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heimdalladmin/Models/Reports/Report.dart';

FirebaseReportsDatabase injectFirebaseReportsDatabase(){
  return FirebaseReportsDatabase.getInstance();
}

class FirebaseReportsDatabase {

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;

  FirebaseReportsDatabase._();
  static FirebaseReportsDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseReportsDatabase._();
  }

  CollectionReference<Report> getCollectionReference(){
    return FirebaseFirestore.instance.collection("Reports").withConverter(
      fromFirestore: (snapshot, options) => Report.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }

  Future<List<Report>> getListOfReports()async{
    var response = await getCollectionReference().get();
    return response.docs.map((e) => e.data()).toList();
  }

}