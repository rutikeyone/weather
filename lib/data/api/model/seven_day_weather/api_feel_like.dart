class ApiFeelsLike {
  ApiFeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final double day;
  late final double night;
  late final double eve;
  late final double morn;

  ApiFeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}
