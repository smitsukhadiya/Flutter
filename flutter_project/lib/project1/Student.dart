class Student {
  Student({
       this.id,
       this.name,
       this.email,
       this.mobile,});

  Student.fromJson(dynamic json) {
    id= json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }
  String? id ;
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