import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';
import 'package:epam_test/src/utils/resources/data_state.dart';

abstract class BaseApiRepository {

  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data, error: error);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.requestOptions,
        );
      }
    } on DioError catch (error) {
      return DataFailed(data: data, error: error);
    }
  }
}
