import 'package:weather_app/models/weather_model.dart';

final class WeatherState {}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

final class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});
}
