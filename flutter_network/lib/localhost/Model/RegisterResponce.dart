import 'User.dart';
import 'dart:convert';

RegisterReponce registerReponceFromJson(String str) => RegisterReponce.fromJson(json.decode(str));
String registerReponceToJson(RegisterReponce data) => json.encode(data.toJson());
class RegisterReponce {
  String? status;
  String? message;
  User? user;

  RegisterReponce({
      this.status, 
      this.message, 
      this.user,});

  RegisterReponce.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

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