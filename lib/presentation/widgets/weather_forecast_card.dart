import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  const WeatherForecastCard(
      {super.key,
      required this.time,
      required this.icon,
      required this.iconColor,
      required this.temperature});

  final String time;
  final IconData icon;
  final Color iconColor;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 88,
          child: Wrap(
            direction: Axis.vertical,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              Text(
                time,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Icon(
                icon,
                size: 32,
                color: iconColor,
                semanticLabel: "weather phenomenon",
              ),
              Text(
                "$temperature°",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
