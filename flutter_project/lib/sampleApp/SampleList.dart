import 'dart:convert';

SampleList sampleListFromJson(String str) => SampleList.fromJson(json.decode(str));
String sampleListToJson(SampleList data) => json.encode(data.toJson());
class SampleList {
  SampleList({
      this.userId, 
      this.id, 
      this.title, 
      this.body,});

  SampleList.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}