import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heimdalladmin/Models/Model/Model.dart';

FirebaseModelsDatabase injectFirebaseModelsDatabase(){
  return FirebaseModelsDatabase.getInstance();
}

class  FirebaseModelsDatabase{

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;

  FirebaseModelsDatabase._();
  static FirebaseModelsDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseModelsDatabase._();
  }

  CollectionReference<Model> getCollectionReference(){
    return _firebaseStorage.collection("Models").withConverter(
      fromFirestore: (snapshot, options) => Model.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }

  Future<void> addModel({required Model model})async{
    var doc = getCollectionReference().doc();
    model.id = doc.id;
    await doc.set(model);
  }

  Stream<QuerySnapshot<Model>> getModelsStream(){
    return getCollectionReference().snapshots();
  }

  Future<void> updateModel({required Model model})async{
    await getCollectionReference().doc(model.id).update(model.toFireStore());
  }

  Future<List<Model>> getModels ()async {
    var response = await getCollectionReference().get();
    return response.docs.map((e) => e.data()).toList();
  }

}