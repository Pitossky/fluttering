import 'package:weather_project/services/location.dart';
import 'package:weather_project/services/networking.dart';

const apiKey = 'b678c46b8b4ee1b457e9ffc57fbc5c17';
const weatherURL = 'api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$weatherURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper aNewNetworkHelper = NetworkHelper(url);
    var weatherData = await aNewNetworkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    WeatherLocation myLocation = WeatherLocation();
    await myLocation.getCurrentWeatherLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$weatherURL?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}