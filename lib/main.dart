import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/Home_Page.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: HomePage(),
              ),
            );
          },
        );
      }),
    );
  }
}

Map<String, MaterialColor> weatherColors = {
  'Sunny': Colors.orange,
  'Clear': Colors.orange,
  'Partly cloudy': Colors.orange,
  'Cloudy': Colors.grey,
  'Overcast': Colors.grey,
  'Mist': Colors.blueGrey,
  'Patchy rain possible': Colors.blue,
  'Light drizzle': Colors.blue,
  'Light rain': Colors.blue,
  'Moderate rain': Colors.blue,
  'Heavy rain': Colors.blue,
  'Blizzard': Colors.blue,
  'Patchy snow possible': Colors.blue,
  'Light snow': Colors.blue,
  'Moderate snow': Colors.blue,
  'Heavy snow': Colors.blue,
  'Freezing fog': Colors.blueGrey,
  'Fog': Colors.blueGrey,
  'Thundery outbreaks possible': Colors.deepPurple,
  'Patchy light rain with thunder': Colors.deepPurple,
  'Moderate or heavy rain with thunder': Colors.deepPurple,
  'Patchy light snow with thunder': Colors.deepPurple,
  'Moderate or heavy snow with thunder': Colors.deepPurple,
};

MaterialColor getThemeColor(String? condition) {
  return weatherColors[condition] ?? Colors.deepPurple;
}
