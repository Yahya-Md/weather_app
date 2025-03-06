import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/remote_failure.dart';
import 'package:weather_app/core/ressources/data_state.dart';
import 'package:weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/features/home/domain/interfaces/get_weather_interface.dart';
import 'package:weather_app/features/home/domain/usecases/get_weather_usecase.dart';
import 'get_weather_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetWeatherInterface>()])
void main() {
  late MockGetWeatherInterface mockGetWeatherInterface;
  late GetWeatherUsecase usecase;
  setUp(() {
    mockGetWeatherInterface = MockGetWeatherInterface();
    usecase = GetWeatherUsecase(mockGetWeatherInterface);
  });

  group("GetWeatherUsecase - call", () {
    const city = "Marrakech";
    DataSuccess<WeatherEntity> response = DataSuccess(
        WeatherEntity(weather: [], main: Main(temp: 23), name: "name"));
    test("return DataSuccess with WeatherEntity on successful", () async {
      when(mockGetWeatherInterface.getWeather(city: city))
          .thenAnswer((_) async => response);

      final result = await usecase(params: city);
      expect(result, isA<DataSuccess<WeatherEntity>>());
      expect((result as DataSuccess<WeatherEntity>).data, isA<WeatherEntity>());
      expect(result.data!.weather, isA<List<Weather>>());
      expect(result.data!.main, isA<Main>());
      expect(result.data!.name, isA<String>());
      verify(mockGetWeatherInterface.getWeather(city: city)).called(1);
    });

    test("return DataError with ServerFailure on Error", () async {
      final failure = ServerFailure("API error");
      final DataState<WeatherEntity> error = DataError(failure);
      when(mockGetWeatherInterface.getWeather(city: city))
          .thenAnswer((_) async => error);

      final result = await usecase(params: city);

      expect(result, isA<DataError>());
      expect((result as DataError).error, isA<ServerFailure>());
      expect((result as DataError).error, equals(failure));
      verify(mockGetWeatherInterface.getWeather(city: city)).called(1);
    });
  });
}
