import 'api_clouds.dart';
import 'api_coord.dart';
import 'api_main.dart';
import 'api_sys.dart';
import 'api_weather.dart';
import 'api_wind.dart';

class ApiCurrentWeatherData {
  ApiCoord? coord;
  List<ApiWeather>? weather;
  String? base;
  ApiMain? main;
  int? visibility;
  ApiWind? wind;
  ApiClouds? clouds;
  int? dt;
  ApiSys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  ApiCurrentWeatherData(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  ApiCurrentWeatherData.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new ApiCoord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <ApiWeather>[];
      json['weather'].forEach((v) {
        weather!.add(new ApiWeather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? new ApiMain.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new ApiWind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? new ApiClouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new ApiSys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = this.base;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    data['visibility'] = this.visibility;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    data['dt'] = this.dt;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['timezone'] = this.timezone;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}
