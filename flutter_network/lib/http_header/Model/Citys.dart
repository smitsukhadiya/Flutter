class Citys {
  Citys({
      required this.cityName,});

  Citys.fromJson(dynamic json) {
    cityName = json['city_name'];
  }
  String? cityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_name'] = cityName;
    return map;
  }

}