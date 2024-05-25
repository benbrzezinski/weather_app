import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherDataProvider {
  Future<String> fetchCurrentWeatherForecast(
      {required double lat, required double lon}) async {
    try {
      const baseUrl = "https://api.openweathermap.org/data/2.5/forecast";
      final query =
          "?lat=$lat&lon=$lon&appid=${dotenv.env["OPEN_WEATHER_API_KEY"]}&units=metric";

      final res = await http.get(Uri.parse("$baseUrl$query"));

      if (res.statusCode == 200) {
        return res.body;
      }

      throw "An unexpected error occurred, please try again later";
    } catch (err) {
      throw err.toString();
    }
  }
}
