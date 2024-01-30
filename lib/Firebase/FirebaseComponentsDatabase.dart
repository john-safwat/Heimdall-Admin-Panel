
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heimdalladmin/Models/Component/Component.dart';


FirebaseComponentsDatabase injectFirebaseComponentDatabase(){
  return FirebaseComponentsDatabase.getInstance();
}

class FirebaseComponentsDatabase {

  final FirebaseFirestore _firebaseStorage = FirebaseFirestore.instance;

  FirebaseComponentsDatabase._();
  static FirebaseComponentsDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseComponentsDatabase._();
  }

  CollectionReference<Component> getCollectionReference(){
    return _firebaseStorage.collection("Components").withConverter(
        fromFirestore: (snapshot, options) => Component.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore(),
    );
  }

  Future<void> addComponent({required Component component})async{
    var doc = getCollectionReference().doc();
    component.id = doc.id;
    await doc.set(component);
  }

  Stream<QuerySnapshot<Component>> getComponentsStream(){
    return getCollectionReference().snapshots();
  }

  Future<void> updateComponent({required Component component})async{
    await getCollectionReference().doc(component.id).update(component.toFireStore());
  }

  Future<List<Component>> getComponents ()async {
    var response = await getCollectionReference().get();
    return response.docs.map((e) => e.data()).toList();
  }

}