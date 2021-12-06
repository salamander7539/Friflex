import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:friflex/data/model/from_api/api_dto.dart';

class CoreApi {
  final Dio _dio = Dio();

  final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // final SecureStorage _secureStorage = locator<SecureStorage>();

  Map<String, String> get headers => {'Content-Type': 'application/json'};

  Options get options => Options(headers: headers);



  Future<ApiDTO> getRequest(String url) async {
    debugPrint(url);

    ApiDTO? result;

    try {
      final response = await _dio.get(
        url,
        options: options,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        result = ApiDTO(response: response.data);
      } else {
        result = ApiDTO(error: response.data!['detail'].toString());
      }
    } catch (e) {
      result = ApiDTO(error: e.toString());
    }
    return result;
  }
}
