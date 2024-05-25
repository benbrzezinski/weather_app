import 'package:flutter/material.dart';
import 'dart:ui';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({
    super.key,
    required this.locationName,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.icon,
    required this.iconColor,
    required this.semanticLabel,
    required this.name,
  });

  final String locationName;
  final int temperature;
  final int maxTemperature;
  final int minTemperature;
  final IconData icon;
  final Color iconColor;
  final String semanticLabel;
  final String name;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      locationName,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      "$temperature°C",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      icon,
                      size: 64,
                      color: iconColor,
                      semanticLabel: semanticLabel,
                    ),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        Text(
                          "H:$maxTemperature°",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "L:$minTemperature°",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
