class ApiMinutely {
  ApiMinutely({
    required this.dt,
    required this.precipitation,
  });
  late final int dt;
  late final int precipitation;

  ApiMinutely.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    precipitation = json['precipitation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['precipitation'] = precipitation;
    return _data;
  }
}
