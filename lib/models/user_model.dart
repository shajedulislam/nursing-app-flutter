class UserModel {
  String? name;
  int? age;
  String? email;

  UserModel({this.name, this.age, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
  }
}
