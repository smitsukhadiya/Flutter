class Person{
  int id;
  String name;
  String email;
  bool ischeked = false;

  Person({required this.id, required this.name, required this.email});

  @override
  String toString() {
    return 'Person{id: $id, name: $name}';
  }
}