import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T data;
  final DioError error;

  const DataState({required this.data, required this.error});
}

// class DataSuccess<T> extends DataState<T> {
//   const DataSuccess(T data) : super(data: data, error: error);
// }

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required super.data, required super.error});
  // const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required super.data, required super.error});
  // const DataFailed(DioError error) : super(error: error);
}