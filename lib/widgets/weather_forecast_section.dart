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
                WeatherForecastCard(),
                WeatherForecastCard(),
                WeatherForecastCard(),
                WeatherForecastCard(),
                WeatherForecastCard(),
              ],
            ),
          )
        ]);
  }
}
