
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heimdalladmin/Models/Feedback/Feedback.dart';

FirebaseFeedbackDatabase injectFirebaseFeedbackDatabase(){
  return FirebaseFeedbackDatabase.getInstance();
}

class FirebaseFeedbackDatabase {

  // singleton pattern
  FirebaseFeedbackDatabase._();
  static FirebaseFeedbackDatabase? _instance;

  static FirebaseFeedbackDatabase getInstance() {
    return _instance ??= FirebaseFeedbackDatabase._();
  }

  // get collection Feedback collection references
  CollectionReference<UserFeedback> getCollectionReference(){
    return FirebaseFirestore.instance.collection("Feedbacks").withConverter(
      fromFirestore: (snapshot, options) => UserFeedback.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),
    );
  }

  Future<List<UserFeedback>> getAllFeedbacks() async{
    var response = await getCollectionReference().get();
    return response.docs.map((e) => e.data()).toList();
  }

}