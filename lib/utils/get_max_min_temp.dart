import 'dart:math';

({num maxTemp, num minTemp}) getMaxMinTemp(List<dynamic> weatherForecastList) {
  final temperatures = <num>[];

  for (int i = 0; i < 9; i++) {
    final num currentMaxTemp = weatherForecastList[i]["main"]["temp_max"];
    final num currentMinTemp = weatherForecastList[i]["main"]["temp_min"];
    temperatures.addAll([currentMaxTemp, currentMinTemp]);
  }

  return (maxTemp: temperatures.reduce(max), minTemp: temperatures.reduce(min));
}
