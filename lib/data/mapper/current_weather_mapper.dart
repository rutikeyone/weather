import 'package:weather_app/data/api/model/current_weather/api_current_weather_data.dart';
import 'package:weather_app/domain/model/current_weather/coord.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/current_weather/main.dart';
import 'package:weather_app/domain/model/current_weather/weather.dart';
import 'package:weather_app/domain/model/current_weather/wind.dart';

class CurrentWeatherMapper {
  static CurrentWeatherData fromApi(ApiCurrentWeatherData data) {
    return CurrentWeatherData(
      name: data.name ?? "",
      date: data.dt != null
          ? DateTime.fromMillisecondsSinceEpoch(data.dt!.toInt() * 1000)
          : DateTime.now(),
      coord: data.coord != null &&
              data.coord!.lat != null &&
              data.coord!.lon != null
          ? Coord(lat: data.coord!.lat!, lon: data.coord!.lon!)
          : Coord(lat: 0.0, lon: 0.0),
      weather: Weather(
        main: data.weather![0].main ?? "",
        description: data.weather![0].description ?? "",
        icon: data.weather![0].icon ?? "",
      ),
      main: Main(
          temp: data.main!.temp ?? 0,
          feelsLike: data.main!.feelsLike ?? 0,
          tempMin: data.main!.tempMin ?? 0,
          tempMax: data.main!.tempMax ?? 0,
          pressure: data.main!.pressure ?? 0,
          humidity: data.main!.humidity ?? 0,
          seaLevel: data.main!.seaLevel ?? 0,
          grndLevel: data.main!.grndLevel ?? 0),
      visibility: data.visibility ?? 0,
      wind: Wind(
        deg: data.wind!.deg ?? 0,
        speed: data.wind!.speed ?? 0,
        gust: data.wind!.gust ?? 0,
      ),
    );
  }
}
