class States {
  States({
      required this.stateName,});

  States.fromJson(dynamic json) {
    stateName = json['state_name'];
  }
  String? stateName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state_name'] = stateName;
    return map;
  }

}