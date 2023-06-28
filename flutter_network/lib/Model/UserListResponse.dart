import 'User.dart';
import 'Support.dart';
import 'dart:convert';

UserListResponse userListResponseFromJson(String str) => UserListResponse.fromJson(json.decode(str));
String userListResponseToJson(UserListResponse data) => json.encode(data.toJson());
class UserListResponse {
  UserListResponse({
      this.page, 
      this.perPage, 
      this.total, 
      this.totalPages, 
      this.userList,
      this.support,});

  UserListResponse.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      userList = [];
      json['data'].forEach((v) {
        userList?.add(User.fromJson(v));
      });
    }
    support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? userList;
  Support? support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    if (userList != null) {
      map['data'] = userList?.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map['support'] = support?.toJson();
    }
    return map;
  }

}