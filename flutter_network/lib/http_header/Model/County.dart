import 'dart:convert';

County countyFromJson(String str) => County.fromJson(json.decode(str));
String countyToJson(County data) => json.encode(data.toJson());
class County {
  County({
      this.countryName, 
      this.countryShortName, 
      this.countryPhoneCode,});

  County.fromJson(dynamic json) {
    countryName = json['country_name'];
    countryShortName = json['country_short_name'];
    countryPhoneCode = json['country_phone_code'];
  }
  String? countryName;
  String? countryShortName;
  int? countryPhoneCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_name'] = countryName;
    map['country_short_name'] = countryShortName;
    map['country_phone_code'] = countryPhoneCode;
    return map;
  }

}