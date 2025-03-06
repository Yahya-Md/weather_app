import 'package:weather_app/core/ressources/data_state.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/domain/interfaces/get_weather_interface.dart';

final class GetWeatherUsecase
    implements Usecase<DataState<WeatherEntity>, String> {
  final GetWeatherInterface _getWeatherInterface;

  GetWeatherUsecase(this._getWeatherInterface);

  @override
  Future<DataState<WeatherEntity>> call({required String params}) async {
    return await _getWeatherInterface.getWeather(city: params);
  }
}
