import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/current_weather_card.dart';
import 'package:weather_app/presentation/widgets/weather_forecast_section.dart';
import 'package:weather_app/presentation/widgets/additional_info_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetched());
  }

  @override
  Widget build(BuildContext context) {
    const double columnGap = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(
                Icons.refresh_rounded,
                size: 30,
                color: Colors.grey[400],
                semanticLabel: "circular refresh arrow",
              ),
              tooltip: "Refresh",
              onPressed: () {
                context.read<WeatherBloc>().add(WeatherFetched());
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  state.error,
                  style: TextStyle(color: Colors.red[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (state is! WeatherSuccess) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.white10,
                  semanticsLabel: "circular progress indicator",
                ),
              ),
            );
          }

          final data = state.weatherModel;
          final weatherForecastList = data.weatherForecastList;
          final locationName = data.locationName;
          final maxTemp = data.maxTemp;
          final minTemp = data.minTemp;
          final icon = data.icon;
          final iconColor = data.iconColor;
          final currentTemp = data.currentTemp;
          final currentWeatherName = data.currentWeatherName;
          final currentHumidity = data.currentHumidity;
          final currentWindSpeed = data.currentWindSpeed;
          final currentPressure = data.currentPressure;

          return SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                children: [
                  CurrentWeatherCard(
                    locationName: locationName,
                    temperature: currentTemp.round(),
                    maxTemperature: maxTemp.round(),
                    minTemperature: minTemp.round(),
                    icon: icon,
                    iconColor: iconColor,
                    semanticLabel: currentWeatherName.toLowerCase(),
                    name: currentWeatherName,
                  ),
                  const SizedBox(
                    height: columnGap,
                  ),
                  WeatherForecastSection(
                    weatherForecastList: weatherForecastList,
                  ),
                  const SizedBox(
                    height: columnGap,
                  ),
                  AdditionalInfoSection(
                    humidity: currentHumidity,
                    windSpeed: currentWindSpeed,
                    pressure: currentPressure,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
