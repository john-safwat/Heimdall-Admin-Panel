import 'package:heimdalladmin/Models/Component/Component.dart';

class Model {
  String? id;
  String? name;
  String? image;
  List<Component>? components;

  Model({
      this.id, 
      this.name, 
      this.image,
      this.components,});

  Model.fromFireStore(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['components'] != null) {
      components = [];
      json['components'].forEach((v) {
        components?.add(Component.fromFireStore(v));
      });
    }
  }

  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    if (components != null) {
      map['components'] = components?.map((v) => v.toFireStore()).toList();
    }
    return map;
  }

}