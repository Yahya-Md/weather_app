import 'package:weather_app/core/ressources/data_state.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';

abstract class GetWeatherInterface {
  Future<DataState<WeatherEntity>> getWeather({required String city});
}
