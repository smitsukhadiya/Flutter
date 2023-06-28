class PracticeRespoce {
  PracticeRespoce({
      required this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.role,
      required this.avatar,
      required this.creationAt,
      required this.updatedAt,});

  PracticeRespoce.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['role'] = role;
    map['avatar'] = avatar;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}