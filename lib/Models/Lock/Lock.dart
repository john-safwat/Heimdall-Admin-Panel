class Lock {
  Lock(
      {required this.id,
      required this.email,
      required this.password,
      required this.firstOwner,
      required this.model,
      required this.createdAt,
      required this.images});

  Lock.fromJson(dynamic json)
      : this(
          id: json['id'],
          email: json['email'],
          password: json['password'],
          firstOwner: json['firstOwner'],
          model: json['model'],
          createdAt: json["createdAt"],
          images:json["images"]
        );
  String id;
  String email;
  String password;
  String firstOwner;
  int createdAt;
  String model;
  List<String> images= [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'firstOwner': firstOwner,
      'model': model,
      "createdAt": createdAt,
      "images" : images
    };
  }
}
