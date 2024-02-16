import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String id;
  String message;
  String uid;
  String email;
  DateTime dateTime;

  Report(
      {required this.id,
        required this.message,
        required this.uid,
        required this.email,
        required this.dateTime});

  Report.fromFireStore(Map<String , dynamic> json):this(
    id : json["id"],
    message : json["message"],
    uid : json["uid"],
    email : json["email"],
    dateTime : (json["dateTime"] as Timestamp).toDate()
  );

  Map<String , dynamic> toFireStore(){
    return {
      "id" : id,
      "message" : message,
      "uid" : uid,
      "email" : email,
      "dateTime" : dateTime,
    };
  }

}
