import 'dart:convert';
import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;
  const WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeatherForecast(
      {double lat = 53.9843, double lon = 20.6112}) async {
    try {
      final weatherData = await weatherDataProvider.fetchCurrentWeatherForecast(
          lat: lat, lon: lon);
      final Map<String, dynamic> data = jsonDecode(weatherData);

      return WeatherModel.fromMap(data);
    } catch (err) {
      throw err.toString();
    }
  }
}
