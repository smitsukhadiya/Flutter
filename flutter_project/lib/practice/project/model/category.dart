class Category{
  int? id;
  String? title;
  String? description;
  String?  imagePath;
  int? date = DateTime.now().millisecondsSinceEpoch;

  Category({this.title, this.description, this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'imagePath': this.imagePath,
      'date': this.date,
    };
  }
}