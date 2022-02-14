import 'package:weather_app/data/repository/get_current_location_data_repository.dart';
import 'package:weather_app/domain/model/current_location/current_location_data.dart';

import '../locator.dart';

class CurrentLocationColntroller {
  Future<CurrentLocationData> getCurrentLocation() async {
    return await getIt.get<GetCurrentLocationRepository>().getCurrentLocation();
  }
}
