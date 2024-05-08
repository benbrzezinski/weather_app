import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_forecast_card.dart';

class WeatherForecastSection extends StatelessWidget {
  const WeatherForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weather Forecast",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                WeatherForecastCard(
                  time: "00:00",
                  icon: Icons.cloud,
                  iconColor: Colors.white,
                  temperature: 20,
                ),
                WeatherForecastCard(
                  time: "03:00",
                  icon: Icons.wb_sunny,
                  iconColor: Colors.yellow,
                  temperature: 21,
                ),
                WeatherForecastCard(
                  time: "06:00",
                  icon: Icons.wb_sunny,
                  iconColor: Colors.yellow,
                  temperature: 22,
                ),
                WeatherForecastCard(
                  time: "09:00",
                  icon: Icons.cloud,
                  iconColor: Colors.white,
                  temperature: 23,
                ),
                WeatherForecastCard(
                  time: "12:00",
                  icon: Icons.wb_sunny,
                  iconColor: Colors.yellow,
                  temperature: 24,
                ),
              ],
            ),
          )
        ]);
  }
}
