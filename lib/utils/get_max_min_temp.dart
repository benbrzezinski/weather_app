import 'dart:math';

({double maxTemp, double minTemp}) getMaxMinTemp(
    List<dynamic> weatherForecastList) {
  final temperatures = <double>[];

  for (int i = 0; i < 9; i++) {
    final double currentMaxTemp = weatherForecastList[i]["main"]["temp_max"];
    final double currentMinTemp = weatherForecastList[i]["main"]["temp_min"];
    temperatures.addAll([currentMaxTemp, currentMinTemp]);
  }

  return (maxTemp: temperatures.reduce(max), minTemp: temperatures.reduce(min));
}
