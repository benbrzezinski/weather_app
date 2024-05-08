import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_information_card.dart';

class AdditionalInformationSection extends StatelessWidget {
  const AdditionalInformationSection({super.key});

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
            AdditionalInformationCard(
              icon: Icons.water_drop,
              semanticLabel: "water drop",
              name: "Humidity",
              value: 94,
            ),
            AdditionalInformationCard(
              icon: Icons.air_rounded,
              semanticLabel: "wind gusts",
              name: "Wind Speed",
              value: 7.67,
            ),
            AdditionalInformationCard(
              icon: Icons.beach_access,
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
