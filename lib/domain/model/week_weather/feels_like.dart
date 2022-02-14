import 'package:http/http.dart';

class FeelsLike {
  final num day;
  final num night;
  final num eve;
  final num morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });
}
