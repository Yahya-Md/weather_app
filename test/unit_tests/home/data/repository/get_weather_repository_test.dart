import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/remote_failure.dart';
import 'package:weather_app/core/ressources/data_state.dart';
import 'package:weather_app/core/services/remote/remote_service.dart';
import 'package:weather_app/features/home/data/repository/get_weather_repository.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/domain/interfaces/get_weather_interface.dart';
import 'get_weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RemoteService>()])
void main() {
  late MockRemoteService mockRemoteService;
  late GetWeatherInterface repository;
  const path = "weather";
  const city = "Marrakech";
  setUp(() {
    mockRemoteService = MockRemoteService();
    repository = GetWeatherRepository(mockRemoteService);
  });
  group("GetWeatherRepository - getWeather", () {
    test("return DataSuccess with WeatherEntity on successful API call",
        () async {
      when(mockRemoteService.get(
        path: path,
        queryParameters: {"q": city},
      )).thenAnswer((_) async => fakeMapResponse);

      final result = await repository.getWeather(city: city);

      expect(result, isA<DataSuccess<WeatherEntity>>());
      expect((result as DataSuccess).data, isA<WeatherEntity>());
      verify(mockRemoteService.get(
        path: path,
        queryParameters: {"q": city},
      )).called(1);
    });

    test(
      'return DataError with ServerFailure on RemoteService failure',
      () async {
        final failure = ServerFailure("API error");
        when(mockRemoteService.get(
          path: path,
          queryParameters: {"q": city},
        )).thenThrow(failure);

        final result = await repository.getWeather(city: city);

        expect(result, isA<DataError>());
        expect((result as DataError).error, isA<ServerFailure>());
        expect((result as DataError).error, equals(failure));
        verify(mockRemoteService.get(
          path: path,
          queryParameters: {"q": city},
        )).called(1);
      },
    );

    test(
      'return DataError with ServerFailure on empty city parameter',
      () async {
        final failure = ServerFailure("API error");
        when(mockRemoteService.get(
          path: path,
          queryParameters: {"q": ""},
        )).thenThrow(failure);

        final result = await repository.getWeather(city: "");

        expect(result, isA<DataError>());
        expect((result as DataError).error, isA<ServerFailure>());
        expect((result as DataError).error, equals(failure));
        verify(mockRemoteService.get(
          path: path,
          queryParameters: {"q": ""},
        )).called(1);
      },
    );
  });
}

final fakeMapResponse = {
  "weather": [
    {"id": 501, "main": "Rain", "description": "moderate rain", "icon": "10d"}
  ],
  "main": {
    "temp": 284.2,
    "feels_like": 282.93,
    "temp_min": 283.06,
    "temp_max": 286.82,
    "pressure": 1021,
    "humidity": 60,
    "sea_level": 1021,
    "grnd_level": 910
  }
};
