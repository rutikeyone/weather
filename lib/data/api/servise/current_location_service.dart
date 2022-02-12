import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/api/model/current_location/api_current_location_data.dart';

class CurrentLocationService {
  @override
  Future<ApiCurrentLocationData> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        throw Exception("Denied forever permition");
      }
      return _getCurrenCurrentLocation();
    }

    return _getCurrenCurrentLocation();
  }

  Future<ApiCurrentLocationData> _getCurrenCurrentLocation() async {
    Position _currentPosition =
        await Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude,
        localeIdentifier: "usa");
    return ApiCurrentLocationData(
        latitude: _currentPosition.latitude,
        longitude: _currentPosition.longitude,
        city: placemarks[0].locality!,
        country: placemarks[0].country!);
  }
}
