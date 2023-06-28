import 'User.dart';
import 'dart:convert';

LoginResponce loginResponceFromJson(String str) => LoginResponce.fromJson(json.decode(str));
String loginResponceToJson(LoginResponce data) => json.encode(data.toJson());
class LoginResponce {
  LoginResponce({
      this.status, 
      this.message, 
      this.user,});

  LoginResponce.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? status;
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}