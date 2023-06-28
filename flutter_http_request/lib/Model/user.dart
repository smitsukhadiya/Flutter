class User{
  int id;
  String email;
  String firstname;
  String lastname;
  String imgurl;

  User({required this.id, required this.email, required this.firstname, required this.lastname, required this.imgurl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      firstname: json["firs_tname"],
      lastname: json["last_name"],
      imgurl: json["avatar"],
    );
  }
//

}