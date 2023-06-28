import 'Student.dart';

class Responce {
  Responce({
      required this.student,});

  Responce.fromJson(dynamic json) {
    if (json['student'] != null) {
      student = [];
      json['student'].forEach((v) {
        student?.add(Student.fromJson(v));
      });
    }
  }
  List<Student>? student;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (student != null) {
      map['student'] = student?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}