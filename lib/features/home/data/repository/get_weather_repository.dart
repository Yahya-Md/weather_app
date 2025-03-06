import 'package:weather_app/core/errors/remote_failure.dart';
import 'package:weather_app/core/ressources/data_state.dart';
import 'package:weather_app/core/services/remote/remote_service.dart';
import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/domain/interfaces/get_weather_interface.dart';

class GetWeatherRepository implements GetWeatherInterface {
  final String _path = "weather";
  final RemoteService _remoteService;

  GetWeatherRepository(this._remoteService);

  @override
  Future<DataState<WeatherResultResponse>> getWeather(
      {required String city}) async {
    try {
      final response =
          await _remoteService.get(path: _path, queryParameters: {"q": city});
      var result = WeatherResultResponse.fromJson(response);
      return DataSuccess(result);
    } on Failure catch (e) {
      return DataError(e);
    }
  }
}
