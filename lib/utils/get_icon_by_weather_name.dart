import 'package:flutter/material.dart';

({IconData icon, Color iconColor}) getIconByWeatherName(String weatherName) {
  const icons = {
    "Clear": (icon: Icons.wb_sunny_rounded, iconColor: Colors.yellow),
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
