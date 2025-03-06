import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/error_constants.dart';
import 'package:weather_app/core/errors/app_failure.dart';
import 'package:weather_app/core/ressources/data_state.dart';
import 'package:weather_app/dependency_container/dependency_container.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/home/presentation/states/weather_state.dart';

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>(
  (ref) =>
      WeatherNotifier(ref.watch<GetWeatherUsecase>(getWeatherUsecaseProvider)),
);

class WeatherNotifier extends StateNotifier<WeatherState> {
  final GetWeatherUsecase _getWeatherUsecase;

  WeatherNotifier(this._getWeatherUsecase) : super(WeatherInital()) {
    Future.microtask(() => getWeather("Marrakech"));
  }

  Future<void> getWeather(String cityName) async {
    state = WeatherLoading();
    DataState<WeatherEntity> result =
        await _getWeatherUsecase(params: cityName);
    if (result is DataSuccess<WeatherEntity>) {
      state = WeatherSuccess(result.data!);
    } else {
      state = WeatherFailure(AppFailure(ErrorConstants.appError));
    }
  }
}
