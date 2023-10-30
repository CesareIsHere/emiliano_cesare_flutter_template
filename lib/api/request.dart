import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emiliano_cesare_flutter_template/api/endpoints.dart';
import 'package:emiliano_cesare_flutter_template/core/utils/query_parser.dart';

Future<Response> handleGet(
    {required String url,
    required String token,
    Map<String, dynamic>? query,
    ResponseType? responseType,
    Function(int, int)? onReceiveProgress}) async {
  // Instancing the dio client
  var dio = Dio();

  query = queryParser(query);

  Response response;

  try {
    response = await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'X-Platform': 'platform',
          'X-AppVersion': apiVersion,
        },
        responseType: responseType,
      ),
      onReceiveProgress: onReceiveProgress,
    );
  } catch (e) {
    rethrow;
  }

  return response;
}

Future<Response> handlePost({
  required String url,
  required String token,
  Map<String, dynamic>? query,
  Map<dynamic, dynamic>? payload,
  String? tenantCode,
}) async {
  // Instancing the dio client
  var dio = Dio();

  query = queryParser(query);

  Response response;

  try {
    response = await dio.post(
      url,
      queryParameters: query,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'X-Platform': 'platform',
          'X-AppVersion': apiVersion,
        },
      ),
      data: payload != null ? jsonEncode(payload) : null,
    );
  } catch (e) {
    rethrow;
  }

  return response;
}

Future<Response> handlePut(
    {required String url,
    required String token,
    Map<dynamic, dynamic>? payload}) async {
  // Instancing the dio client
  var dio = Dio();

  Response response;

  try {
    response = await dio.put(
      url,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'X-Platform': 'platform',
          'X-AppVersion': apiVersion,
        },
      ),
      data: payload,
    );
  } catch (e) {
    rethrow;
  }

  return response;
}

Future<Response> handlePatch(
    {required String url, required String token, Map<dynamic, dynamic>? payload}) async {
  // Instancing the dio client
  var dio = Dio();

  Response response;

  try {
    response = await dio.patch(
      url,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'X-Platform': 'platform',
          'X-AppVersion': apiVersion,
        },
      ),
      data: payload,
    );
  } catch (e) {
    rethrow;
  }

  return response;
}

Future<Response> handleDelete(
    {required String url, required String token, Map<dynamic, dynamic>? payload}) async {
  // Instancing the dio client
  var dio = Dio();


  Response response;

  try {
    response = await dio.delete(
      url,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'X-Platform': 'platform',
          'X-AppVersion': apiVersion,
        },
      ),
      data: payload,
    );
  } catch (e) {
    rethrow;
  }

  return response;
}
