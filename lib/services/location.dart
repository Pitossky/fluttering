import 'package:geolocator/geolocator.dart';

class WeatherLocation {
  double? longitude;
  double? latitude;

  Future<void> getCurrentWeatherLocation() async {
    try {
      Position myPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = myPosition.latitude;
      longitude = myPosition.longitude;
    }
    catch (e) {
      print(e);
    }
  }
}

