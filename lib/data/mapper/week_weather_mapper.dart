import 'package:weather_app/data/api/model/week_weather/api_week_weather_data.dart';
import 'package:weather_app/domain/model/week_weather/current.dart';
import 'package:weather_app/domain/model/week_weather/daily.dart';
import 'package:weather_app/domain/model/week_weather/feels_like.dart';
import 'package:weather_app/domain/model/week_weather/hourly.dart';
import 'package:weather_app/domain/model/week_weather/week_weather_data.dart';
import 'package:weather_app/domain/model/week_weather/temp.dart';
import 'package:weather_app/domain/model/week_weather/weather.dart';

class WeekWeatherMapper {
  static WeekWeatherData fromApi(ApiWeekWeatherData data) {
    return WeekWeatherData(
      lat: data.lat ?? 0,
      lon: data.lon ?? 0,
      timezone: data.timezone ?? "",
      timezoneOffset: data.timezoneOffset ?? 0,
      current: Current(
        dt: data.current != null ? data.current!.dt ?? 0 : 0,
        sunrise: data.current != null ? data.current!.dt ?? 0 : 0,
        sunset: data.current != null ? data.current!.sunset ?? 0 : 0,
        temp: data.current != null ? data.current!.temp ?? 0 : 0,
        feelsLike: data.current != null ? data.current!.feelsLike ?? 0 : 0,
        pressure: data.current != null ? data.current!.pressure ?? 0 : 0,
        humidity: data.current != null ? data.current!.humidity ?? 0 : 0,
        dewPoint: data.current != null ? data.current!.dewPoint ?? 0 : 0,
        uvi: data.current != null ? data.current!.uvi ?? 0 : 0,
        clouds: data.current!.clouds!,
        visibility: data.current != null ? data.current!.visibility ?? 0 : 0,
        windSpeed: data.current != null ? data.current!.windSpeed ?? 0 : 0,
        windDeg: data.current != null ? data.current!.windDeg ?? 0 : 0,
        windGust: data.current != null ? data.current!.windGust ?? 0 : 0,
        weather: data.current != null
            ? data.current!.weather != null
                ? data.current!.weather!
                    .map(
                      (item) => Weather(
                          id: item.id!,
                          main: item.main!,
                          description: item.description!,
                          icon: item.icon!),
                    )
                    .toList()
                : List.empty()
            : List.empty(),
      ),
      hourlies: data.hourly!.length >= 24
          ? data.hourly != null
              ? data.hourly!
                  .take(24)
                  .map(
                    (item) => Hourly(
                        hour: (DateTime.fromMillisecondsSinceEpoch(
                                item.dt!.toInt() * 1000))
                            .hour,
                        temp: item.temp!,
                        feelsLike: item.feelsLike!,
                        pressure: item.pressure!,
                        humidity: item.humidity!,
                        dewPoint: item.dewPoint!,
                        uvi: item.uvi!,
                        clouds: item.clouds!,
                        visibility: item.visibility!,
                        weather: Weather(
                            id: item.weather![0].id!,
                            main: item.weather![0].main!,
                            description: item.weather![0].description!,
                            icon: item.weather![0].icon!),
                        windDeg: item.windDeg!,
                        windSpeed: item.windSpeed!,
                        windGust: item.windGust!,
                        pop: item.pop!),
                  )
                  .toList()
              : List.empty()
          : data.hourly != null
              ? data.hourly!
                  .map((item) => Hourly(
                      hour: DateTime.fromMillisecondsSinceEpoch(
                              item.dt!.toInt() * 1000)
                          .hour,
                      temp: item.temp!,
                      feelsLike: item.feelsLike!,
                      pressure: item.pressure!,
                      humidity: item.humidity!,
                      dewPoint: item.dewPoint!,
                      uvi: item.uvi!,
                      clouds: item.clouds!,
                      visibility: item.visibility!,
                      weather: Weather(
                          id: item.weather![0].id!,
                          main: item.weather![0].main!,
                          description: item.weather![0].description!,
                          icon: item.weather![0].icon!),
                      windDeg: item.windDeg!,
                      windSpeed: item.windSpeed!,
                      windGust: item.windGust!,
                      pop: item.pop!))
                  .toList()
              : List.empty(),
      dailies: data.daily != null
          ? data.daily!
              .skip(1)
              .map(
                (item) => Daily(
                  date: item.dt != null
                      ? DateTime.fromMillisecondsSinceEpoch(
                          item.dt!.toInt() * 1000)
                      : DateTime.now(),
                  sunrise: item.sunrise ?? 0,
                  sunset: item.sunset ?? 0,
                  moonrise: item.moonrise ?? 0,
                  moonset: item.moonset ?? 0,
                  moonPhase: item.moonPhase ?? 0,
                  temp: Temp(
                      day: item.temp!.day!,
                      min: item.temp!.min!,
                      max: item.temp != null ? item.temp!.max ?? 0 : 0,
                      night: item.temp != null ? item.temp!.night ?? 0 : 0,
                      morn: item.temp != null ? item.temp!.morn ?? 0 : 0,
                      eve: item.temp != null ? item.temp!.eve ?? 0 : 0),
                  feelsLike: FeelsLike(
                    day: item.feelsLike != null ? item.feelsLike!.day ?? 0 : 0,
                    night:
                        item.feelsLike != null ? item.feelsLike!.night ?? 0 : 0,
                    eve: item.feelsLike != null ? item.feelsLike!.eve ?? 0 : 0,
                    morn:
                        item.feelsLike != null ? item.feelsLike!.morn ?? 0 : 0,
                  ),
                  pressure: item.pressure ?? 0,
                  humidity: item.humidity ?? 0,
                  dewPoint: item.dewPoint ?? 0,
                  windSpeed: item.windSpeed ?? 0,
                  windDeg: item.windDeg ?? 0,
                  windGust: item.windGust ?? 0,
                  weather: item.weather != null
                      ? item.weather!
                          .map(
                            (item) => Weather(
                                id: item.id ?? 0,
                                main: item.main ?? "",
                                description: item.description ?? "",
                                icon: item.icon ?? ""),
                          )
                          .toList()
                      : List.empty(),
                  clouds: item.clouds ?? 0,
                  pop: item.pop ?? 0,
                  uvi: item.uvi ?? 0,
                ),
              )
              .toList()
          : List.empty(),
    );
  }
}
