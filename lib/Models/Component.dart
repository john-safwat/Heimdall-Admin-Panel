class Component {

  String name;
  String description;
  String type;
  String image;
  double cost;

  Component(
      {required this.name,
      required this.description,
      required this.type,
      required this.image,
      required this.cost});

  Component.fromFireStore(Map<String , dynamic> json):this(
      name : json["name"],
      description : json["description"],
      type : json["type"],
      image : json["image"],
      cost : json["cost"],
  );

  Map<String , dynamic> toFireStore(){
    return {
      "name" : name,
      "description" : description,
      "type" : type,
      "image" : image,
      "cost" : cost,
    };
  }

}
