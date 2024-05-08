import 'package:flutter/material.dart';
import 'dart:ui';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard(
      {super.key,
      required this.temperature,
      required this.icon,
      required this.iconColor,
      required this.name});

  final int temperature;
  final IconData icon;
  final Color iconColor;
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
                  spacing: 15,
                  children: [
                    Text(
                      "$temperature°C",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      icon,
                      size: 64,
                      color: iconColor,
                      semanticLabel: "weather phenomenon",
                    ),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
