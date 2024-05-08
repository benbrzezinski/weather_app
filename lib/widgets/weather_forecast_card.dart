import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  const WeatherForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: SizedBox(
          width: 92,
          child: Wrap(
            direction: Axis.vertical,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              Text(
                "09:00",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.cloud,
                size: 32,
                semanticLabel: "weather phenomenon",
              ),
              Text(
                "21°C",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
