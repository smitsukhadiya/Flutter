import 'User.dart';
import 'dart:convert';

SignUpResponce signUpResponceFromJson(String str) => SignUpResponce.fromJson(json.decode(str));
String signUpResponceToJson(SignUpResponce data) => json.encode(data.toJson());
class SignUpResponce {
  SignUpResponce({
      this.status, 
      this.message, 
      this.user,});

  SignUpResponce.fromJson(dynamic json) {
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