import 'package:flutter/material.dart';

({IconData icon, Color iconColor}) getIconByWeatherName(
    {required String weatherName, required String hourTime}) {
  final isDaytime =
      hourTime != "21" && hourTime != "00" && hourTime != "03" ? true : false;

  final icons = {
    "Clear": (
      icon: isDaytime ? Icons.wb_sunny_rounded : Icons.nightlight,
      iconColor: Colors.yellow
    ),
    "Clouds": (icon: Icons.cloud, iconColor: Colors.white),
    "Rain": (icon: Icons.beach_access, iconColor: Colors.blue),
    "Drizzle": (icon: Icons.umbrella, iconColor: Colors.cyan),
    "Thunderstorm": (
      icon: Icons.thunderstorm_rounded,
      iconColor: Colors.indigo
    ),
    "Snow": (icon: Icons.cloudy_snowing, iconColor: Colors.white),
  };

  return icons[weatherName] ?? (icon: Icons.foggy, iconColor: Colors.grey);
}
