import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/widgets/weather_forecast_card.dart';
import 'package:weather_app/utils/get_icon_by_weather_name.dart';

class WeatherForecastSection extends StatelessWidget {
  const WeatherForecastSection({super.key, required this.weatherForecastList});

  final List<dynamic> weatherForecastList;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Weather Forecast",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 125,
        child: ListView.builder(
            prototypeItem: const WeatherForecastCard(
              time: "00:00",
              icon: Icons.cloud,
              iconColor: Colors.white,
              temperature: 20,
            ),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.antiAlias,
            itemCount: 8,
            itemBuilder: (context, i) {
              final Map<String, dynamic> item = weatherForecastList[i + 1];
              final String name = item["weather"][0]["main"];
              final dateTime = DateTime.parse(item["dt_txt"]);
              final time = DateFormat.H().format(dateTime);
              final (:icon, :iconColor) =
                  getIconByWeatherName(weatherName: name, hourTime: time);
              final num temp = item["main"]["temp"];

              return WeatherForecastCard(
                time: time,
                icon: icon,
                iconColor: iconColor,
                temperature: temp.round(),
              );
            }),
      )
    ]);
  }
}
