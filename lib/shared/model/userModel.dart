class UserModel {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? password;


  UserModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.password,
  });

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    mobile = json["mobile"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["mobile"] = mobile;
    data["profile"] = password;
    return data;
  }
}