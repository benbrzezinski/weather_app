import 'package:flutter/material.dart';
import 'package:weather_app/widgets/current_weather_card.dart';
import 'package:weather_app/widgets/weather_forecast_section.dart';
import 'package:weather_app/widgets/additional_info_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                debugPrint("refreshed");
              },
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            children: [
              CurrentWeatherCard(
                temperature: 19,
                icon: Icons.wb_sunny,
                iconColor: Colors.yellow,
                name: "Sunny",
              ),
              SizedBox(
                height: columnGap,
              ),
              WeatherForecastSection(),
              SizedBox(
                height: columnGap,
              ),
              AdditionalInfoSection()
            ],
          ),
        ),
      ),
    );
  }
}
