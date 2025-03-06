import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/remote_failure.dart';
import 'package:weather_app/core/services/remote/remote_service.dart';
import 'remote_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late RemoteService remoteService;

  setUp(() {
    mockDio = MockDio();
    remoteService = RemoteServiceImpl(mockDio);
  });
  group("RemoteServiceImpl - get", () {
    String path = "weather";
    test('should return data when the response is successful', () async {
      final fakeResponse = {"weather": "Sunny"};
      final response = Response(
        data: fakeResponse,
        statusCode: codeOK,
        requestOptions: RequestOptions(path: path),
      );

      when(mockDio.get(any, queryParameters: anyNamed("queryParameters")))
          .thenAnswer((_) async => response);

      final result = await remoteService.get(path: path);

      expect(result, equals(fakeResponse));
      verify(mockDio.get(any, queryParameters: anyNamed("queryParameters")))
          .called(1);
    });

    test('throws ServerFailure on non-200 status code', () async {
      final response = Response(
        data: {},
        statusCode: 404,
        requestOptions: RequestOptions(path: path),
      );
      when(mockDio.get(any, queryParameters: anyNamed("queryParameters")))
          .thenAnswer((_) async => response);
      expect(
          () => remoteService.get(path: path), throwsA(isA<ServerFailure>()));
    });

    test('throws ServerFailure on DioException', () async {
      final dioException =
          DioException(requestOptions: RequestOptions(path: path));
      when(mockDio.get(
        any,
        queryParameters: anyNamed("queryParameters"),
      )).thenThrow(dioException);

      expect(
          () => remoteService.get(path: path), throwsA(isA<ServerFailure>()));
    });
  });
}
