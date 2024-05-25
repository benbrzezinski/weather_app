import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_onWeatherFetched);
  }

  void _onWeatherFetched(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherPending());

    try {
      final weatherModel = await weatherRepository.getCurrentWeatherForecast();
      emit(WeatherSuccess(weatherModel));
    } catch (err) {
      emit(WeatherFailure(err.toString()));
    }
  }
}
