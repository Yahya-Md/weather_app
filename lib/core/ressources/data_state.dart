import 'package:weather_app/core/errors/remote_failure.dart';

abstract class DataState<T> {
  final T? data;
  final Failure? error;
  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  const DataError(Failure error) : super(error: error);
}
