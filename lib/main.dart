import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/pages/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            log(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel == null
                  ? "null"
                  : BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel!
                      .weatherCondition
                      .toString(),
            );

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather App',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor:
                      BlocProvider.of<GetWeatherCubit>(context).weatherModel ==
                              null
                          ? Colors.brown
                          : BlocProvider.of<GetWeatherCubit>(context)
                                      .weatherModel!
                                      .weatherCondition ==
                                  'Partly Cloudy'
                              ? Colors.lightBlue
                              : Colors.yellow,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.brown;
  final lowercaseCondition = condition.toLowerCase();
  switch (lowercaseCondition) {
    case "sunny":
    case "clear":
      return Colors.yellow;
    case "partly cloudy":
    case "overcast":
      return Colors.lightBlue;
    case "cloudy":
      return Colors.grey;
    case "mist":
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
      return Colors.blueGrey;
    case "thundery outbreaks possible":
      return Colors.deepPurple;
    case "blowing snow":
    case "blizzard":
    case "fog":
    case "freezing fog":
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "light sleet":
    case "moderate or heavy sleet":
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "ice pellets":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
    case "light sleet showers":
    case "moderate or heavy sleet showers":
    case "light snow showers":
    case "moderate or heavy snow showers":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.grey;
    default:
      return Colors.green; // Default color for unknown conditions
  }
}
