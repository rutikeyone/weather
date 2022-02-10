import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';

abstract class LocationRepository {
  Future<CurrentLocationData> getCurrentLocation();
}
