import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioError? error;
  final String? errorMessage;
  final String? successMessage;

  const DataState(
      {this.successMessage, this.errorMessage, this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataSuccessMessage<T> extends DataState<T> {
  const DataSuccessMessage(String successMessage)
      : super(successMessage: successMessage);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(error: error);
}

class DataFailedMessage<T> extends DataState<T> {
  const DataFailedMessage(String errorMessage)
      : super(errorMessage: errorMessage);
}
