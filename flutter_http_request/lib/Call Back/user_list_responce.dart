import 'package:flutter_http_request/Model/support.dart';

import '../Model/user.dart';

class UserListResponse{
  int page;
  int perpage;
  int total;
  int totalpages;
Support support;
List<User>userlist;

  UserListResponse({required this.page, required this.perpage, required this.total, required this.totalpages,
    required this.support, required this.userlist});

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      page: json["page"],
      perpage: json["per_page"],
      total: json["total"],
      totalpages: json["total_pages"],
      support: Support.fromJson(json["support"]),
      userlist: (json["data"] as List).map((e) => User.fromJson(e)).toList()
    );
  }
}