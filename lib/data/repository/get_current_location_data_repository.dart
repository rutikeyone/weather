import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/data/api/service_util.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';

import 'package:weather_app/domain/repository/location_repository.dart';

class GetCurrentLocationRepository extends LocationRepository {
  final ServiceUtils util;

  GetCurrentLocationRepository({required this.util});

  @override
  Future<CurrentLocationData> getCurrentLocation() {
    return util.getCurrentLocationData();
  }
}
