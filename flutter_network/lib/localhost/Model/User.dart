import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.mobile,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }
  String? id;
  String? name;
  String? email;
  String? mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    return map;
  }

}