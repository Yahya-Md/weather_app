import 'package:weather_app/core/errors/remote_failure.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';

abstract class WeatherState {
  final WeatherEntity? weatherEntity;
  final Failure? failure;

  WeatherState({this.weatherEntity, this.failure});
}

class WeatherInital extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherSuccess(WeatherEntity weatherEntity)
      : super(weatherEntity: weatherEntity);
}

class WeatherFailure extends WeatherState {
  WeatherFailure(Failure failure) : super(failure: failure);
}
