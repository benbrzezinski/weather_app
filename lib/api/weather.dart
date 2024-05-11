import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

Future<Map<String, dynamic>?> getCurrentWeatherForecast() async {
  try {
    final res = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=53.9843&lon=20.6112&appid=${dotenv.env["OPEN_WEATHER_API_KEY"]}&units=metric"));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }

    throw "An unexpected error occurred, please try again later";
  } catch (err) {
    throw err.toString();
  }
}
