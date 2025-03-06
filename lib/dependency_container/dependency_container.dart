import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core/services/remote/remote_service.dart';
import 'package:weather_app/features/home/data/repository/get_weather_repository.dart';
import 'package:weather_app/features/home/domain/interfaces/get_weather_interface.dart';
import 'package:weather_app/features/home/domain/usecases/get_weather_usecase.dart';

part 'dependency_container.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
RemoteService remoteService(Ref ref) {
  return RemoteServiceImpl(ref.read<Dio>(dioProvider));
}

@riverpod
GetWeatherInterface getWeatherRepository(Ref ref) {
  return GetWeatherRepository(ref.read<RemoteService>(remoteServiceProvider));
}

@riverpod
GetWeatherUsecase getWeatherUsecase(Ref ref) {
  return GetWeatherUsecase(
      ref.read<GetWeatherInterface>(getWeatherRepositoryProvider));
}
