class ResidentModel {
  int? bedNumber;
  String? address;
  String? email;
  int? age;
  String? name;

  ResidentModel(
      {this.bedNumber, this.address, this.email, this.age, this.name});

  ResidentModel.fromJson(Map<String, dynamic> json) {
    bedNumber = json['bed_number'];
    address = json['Address'];
    email = json['email'];
    age = json['Age'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bed_number'] = bedNumber;
    data['Address'] = address;
    data['email'] = email;
    data['Age'] = age;
    data['name'] = name;
    return data;
  }
}
