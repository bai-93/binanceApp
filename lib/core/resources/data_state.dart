import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? dioError;

  const DataState({this.data, this.dioError});
}

class SuccessDataState<T> extends DataState<T> {
  const SuccessDataState(T data) : super(data: data);
}

class FailedDataState<T> extends DataState<T> {
  const FailedDataState(DioException error)
      : super(
            dioError:
                error); // this won't work  const FailedDataState(T error) : super(dioError: error)
}
