import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/presentation/states/get_weather_provider.dart';
import 'package:weather_app/features/home/presentation/states/weather_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async => ref
              .watch(weatherNotifierProvider.notifier)
              .getWeather("Marrakech"),
          child: ListView(
            children: [
              switch (weatherState) {
                WeatherInital() => SizedBox.shrink(),
                WeatherLoading() => CircularProgressIndicator.adaptive(),
                WeatherSuccess() =>
                  WeatherSuccessContent(weatherState: weatherState),
                WeatherFailure() => Text(weatherState.failure!.message),
                WeatherState() => throw UnimplementedError(),
              }
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherSuccessContent extends StatelessWidget {
  const WeatherSuccessContent({
    super.key,
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
    WeatherEntity entity = weatherState.weatherEntity!;
    Weather weather = entity.weather.first;
    return Column(
      children: [
        Image.network(
            "https://openweathermap.org/img/wn/${weather.icon}@2x.png"),
        Text(entity.name),
        Text(weather.main),
        Text(weather.description),
      ],
    );
  }
}
