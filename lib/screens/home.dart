import 'package:flutter/material.dart';
import 'package:weather_app/api/weather.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/weather_forecast_section.dart';
import 'package:weather_app/widgets/additional_info_section.dart';
import 'package:weather_app/utils/get_icon_by_weather_name.dart';
import 'package:weather_app/utils/get_max_min_temp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Map<String, dynamic>?> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    const double columnGap = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        titleTextStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(
                Icons.refresh_rounded,
                size: 30,
                color: Colors.grey[400],
                semanticLabel: "circular refresh arrow",
              ),
              tooltip: "Refresh",
              onPressed: () {
                setState(() {
                  weather = getCurrentWeatherForecast();
                });
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.white10,
                  semanticsLabel: "circular progress indicator",
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red[600]),
                ),
              ),
            );
          }

          final data = snapshot.data!;

          final String locationName = data["city"]["name"];
          final Map<String, dynamic> currentWeatherData = data["list"][0];
          final List<dynamic> weatherForecastList = data["list"];

          final double currentTemp = currentWeatherData["main"]["temp"];
          final (:maxTemp, :minTemp) = getMaxMinTemp(weatherForecastList);
          final String currentWeatherName =
              currentWeatherData["weather"][0]["main"];
          final (:icon, :iconColor) = getIconByWeatherName(currentWeatherName);

          final num currentHumidity = currentWeatherData["main"]["humidity"];
          final num currentWindSpeed = currentWeatherData["wind"]["speed"];
          final num currentPressure = currentWeatherData["main"]["pressure"];

          return SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                children: [
                  CurrentWeatherCard(
                    locationName: locationName,
                    temperature: currentTemp.round(),
                    maxTemperature: maxTemp.round(),
                    minTemperature: minTemp.round(),
                    icon: icon,
                    iconColor: iconColor,
                    semanticLabel: currentWeatherName.toLowerCase(),
                    name: currentWeatherName,
                  ),
                  const SizedBox(
                    height: columnGap,
                  ),
                  WeatherForecastSection(
                    weatherForecastList: weatherForecastList,
                  ),
                  const SizedBox(
                    height: columnGap,
                  ),
                  AdditionalInfoSection(
                    humidity: currentHumidity,
                    windSpeed: currentWindSpeed,
                    pressure: currentPressure,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
