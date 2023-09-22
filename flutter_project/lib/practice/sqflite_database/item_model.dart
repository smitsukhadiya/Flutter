class ItemModel {
  int? id;
  String name, email, number;

  ItemModel(
      {this.id, required this.name, required this.email, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'number': number,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      number: map['number'],
    );
  }
}
