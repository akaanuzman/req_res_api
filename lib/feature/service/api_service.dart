// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../products/constants/index.dart';
import '../models/base_model.dart';

enum Endpoint { login, register, users }

enum ResponseKeys { data, token, error }

/// `ApiService` class
/// This class is written to manage the methods to be done in the api.
@immutable
final class ApiService {
  const ApiService._();

  /// Generic method that allows you to fetch data from the api
  /// Parameters:
  /// [url] -> API Url
  /// [model] -> Model created from json data returned from api
  /// [key] -> Key value of the data to be fetched from the api
  ///
  /// Returns: Returns a tuple data type. First returned value in Tuple [Generic] list of data retrieved from api
  /// Second value [error] message
  static Future<(List<T>, String?)> fetchAllData<T extends BaseModel>({
    required String url,
    required T model,
    required String key,
  }) async {
    final Dio dio = Dio();

    try {
      final Response response = await dio.get(url);
      var array = <T>[];

      if (response.statusCode == HttpStatus.ok) {
        Iterable listBest = response.data[key];
        array = listBest.map<T>((element) => model.fromJson(element)).toList();
        return (array, null);
      } else {
        String? errorMessage =
            response.data[ResponseKeys.error.name] as String?;
        return (array, errorMessage);
      }
    } on DioException catch (e) {
      var array = <T>[];

      if (e.response == null)
        return (array, StringConstants.somethingWentWrong);

      String? errorMessage =
          e.response!.data[ResponseKeys.error.name] as String?;
      return (array, errorMessage);
    }
  }

  /// Generic method that allows us to assign post to api
  /// Parameters:
  /// [url] -> API Url
  /// [model] -> Model created from json data returned from api
  /// [body] -> Data to be sent to API in Map<String,dynamic> type
  ///
  /// Returns: Returns a tuple data type. First returned value in Tuple [Generic] list of data retrieved from api
  /// Second value [error] message
  static Future<(T, String?)> post<T extends BaseModel>({
    required String url,
    required T model,
    required Map<String, dynamic> body,
  }) async {
    final dio = Dio();

    try {
      final Response response = await dio.post(
        url,
        data: body,
      );

      if (response.statusCode == HttpStatus.ok) {
        model = model.fromJson(response.data);
        return (model, null);
      } else {
        String? errorMessage =
            response.data[ResponseKeys.error.name] as String?;
        return (model, errorMessage);
      }
    } on DioException catch (e) {
      if (e.response == null)
        return (model, StringConstants.somethingWentWrong);

      String? errorMessage =
          e.response!.data[ResponseKeys.error.name] as String?;
      return (model, errorMessage);
    }
  }
}
