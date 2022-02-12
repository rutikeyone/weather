import 'dart:convert';

import 'package:weather_app/data/api/model/seven_day_weather/api_one_call_data.dart';
import 'package:weather_app/data/api/request/get_current_weather_body.dart';
import 'package:http/http.dart' as http;

class SevenDaysWeatherService {
  Future<ApiOneCallData> getSevenDaysWeatherData(GetWeatherBody body) async {
    final _BASE_URL =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${body.latitude}&lon=${body.longitude}&exclude=alerts&appid=${body.apiKey}&units=${body.units}";
    final responce = await http.get(Uri.parse(_BASE_URL));
    final data = jsonDecode(responce.body);
    ApiOneCallData _oneCallData = ApiOneCallData.empty();
    if (responce.statusCode == 200) {
      _oneCallData = ApiOneCallData.fromJson(data);
    }

    return _oneCallData;
  }
}
