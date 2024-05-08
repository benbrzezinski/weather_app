import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_info_item.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Additional Information",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AdditionalInfoItem(
              icon: Icons.water_drop,
              iconColor: Colors.blue,
              semanticLabel: "water drop",
              name: "Humidity",
              value: 94,
            ),
            AdditionalInfoItem(
              icon: Icons.air_rounded,
              iconColor: Colors.teal,
              semanticLabel: "wind gusts",
              name: "Wind Speed",
              value: 7.67,
            ),
            AdditionalInfoItem(
              icon: Icons.beach_access,
              iconColor: Colors.red,
              semanticLabel: "open umbrella",
              name: "Pressure",
              value: 1006,
            )
          ],
        )
      ],
    );
  }
}
