class Support{
  String url;
  String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json["url"],
      text: json["text"],
    );
  }
//
}