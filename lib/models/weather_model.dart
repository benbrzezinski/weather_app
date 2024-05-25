// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/get_icon_by_weather_name.dart';
import 'package:weather_app/utils/get_max_min_temp.dart';

class WeatherModel {
  final List<dynamic> weatherForecastList;
  final String locationName;
  final num maxTemp;
  final num minTemp;
  final IconData icon;
  final Color iconColor;
  final num currentTemp;
  final String currentWeatherName;
  final num currentHumidity;
  final num currentWindSpeed;
  final num currentPressure;

  WeatherModel({
    required this.weatherForecastList,
    required this.locationName,
    required this.maxTemp,
    required this.minTemp,
    required this.icon,
    required this.iconColor,
    required this.currentTemp,
    required this.currentWeatherName,
    required this.currentHumidity,
    required this.currentWindSpeed,
    required this.currentPressure,
  });

  WeatherModel copyWith({
    List<dynamic>? weatherForecastList,
    String? locationName,
    num? maxTemp,
    num? minTemp,
    IconData? icon,
    Color? iconColor,
    num? currentTemp,
    String? currentWeatherName,
    num? currentHumidity,
    num? currentWindSpeed,
    num? currentPressure,
  }) {
    return WeatherModel(
      weatherForecastList: weatherForecastList ?? this.weatherForecastList,
      locationName: locationName ?? this.locationName,
      maxTemp: maxTemp ?? this.maxTemp,
      minTemp: minTemp ?? this.minTemp,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      currentTemp: currentTemp ?? this.currentTemp,
      currentWeatherName: currentWeatherName ?? this.currentWeatherName,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentPressure: currentPressure ?? this.currentPressure,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weatherForecastList': weatherForecastList,
      'locationName': locationName,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'icon': icon.codePoint,
      'iconColor': iconColor.value,
      'currentTemp': currentTemp,
      'currentWeatherName': currentWeatherName,
      'currentHumidity': currentHumidity,
      'currentWindSpeed': currentWindSpeed,
      'currentPressure': currentPressure,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final List<dynamic> weatherForecastList = map["list"];
    final Map<String, dynamic> currentWeatherData = map["list"][0];
    final String currentWeatherName = currentWeatherData["weather"][0]["main"];
    final (:maxTemp, :minTemp) = getMaxMinTemp(weatherForecastList);
    final currentDateTime =
        DateTime.parse(currentWeatherData["dt_txt"] as String);
    final currentTime = DateFormat.H().format(currentDateTime);
    final (:icon, :iconColor) = getIconByWeatherName(
        weatherName: currentWeatherName, hourTime: currentTime);

    return WeatherModel(
      weatherForecastList: weatherForecastList,
      locationName: map["city"]["name"] as String,
      maxTemp: maxTemp,
      minTemp: minTemp,
      icon: icon,
      iconColor: iconColor,
      currentTemp: currentWeatherData["main"]["temp"] as num,
      currentWeatherName: currentWeatherName,
      currentHumidity: currentWeatherData["main"]["humidity"] as num,
      currentWindSpeed: currentWeatherData["wind"]["speed"] as num,
      currentPressure: currentWeatherData["main"]["pressure"] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(weatherForecastList: $weatherForecastList, locationName: $locationName, maxTemp: $maxTemp, minTemp: $minTemp, icon: $icon, iconColor: $iconColor, currentTemp: $currentTemp, currentWeatherName: $currentWeatherName, currentHumidity: $currentHumidity, currentWindSpeed: $currentWindSpeed, currentPressure: $currentPressure)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.weatherForecastList, weatherForecastList) &&
        other.locationName == locationName &&
        other.maxTemp == maxTemp &&
        other.minTemp == minTemp &&
        other.icon == icon &&
        other.iconColor == iconColor &&
        other.currentTemp == currentTemp &&
        other.currentWeatherName == currentWeatherName &&
        other.currentHumidity == currentHumidity &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentPressure == currentPressure;
  }

  @override
  int get hashCode {
    return weatherForecastList.hashCode ^
        locationName.hashCode ^
        maxTemp.hashCode ^
        minTemp.hashCode ^
        icon.hashCode ^
        iconColor.hashCode ^
        currentTemp.hashCode ^
        currentWeatherName.hashCode ^
        currentHumidity.hashCode ^
        currentWindSpeed.hashCode ^
        currentPressure.hashCode;
  }
}
