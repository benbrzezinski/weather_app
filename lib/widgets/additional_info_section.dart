import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_info_item.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection(
      {super.key,
      required this.humidity,
      required this.windSpeed,
      required this.pressure});

  final num humidity;
  final num windSpeed;
  final num pressure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Additional Information",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AdditionalInfoItem(
              icon: Icons.water_drop,
              iconColor: Colors.lightBlue,
              semanticLabel: "water drop",
              name: "Humidity",
              value: humidity,
            ),
            AdditionalInfoItem(
              icon: Icons.air_rounded,
              iconColor: Colors.teal,
              semanticLabel: "wind speed icon",
              name: "Wind Speed",
              value: windSpeed,
            ),
            AdditionalInfoItem(
              icon: Icons.compress_rounded,
              iconColor: Colors.red,
              semanticLabel: "compressing icon",
              name: "Pressure",
              value: pressure,
            )
          ],
        )
      ],
    );
  }
}
