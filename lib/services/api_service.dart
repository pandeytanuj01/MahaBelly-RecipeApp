import 'dart:io';
import 'package:MahaBelly/Constants/static_api.dart';
import 'package:MahaBelly/networking/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ApiBaseHelper {
  final String _baseUrl = ApiStatic.baseURL;
  Future<dynamic> get(String url) async {
    Map<String, dynamic> responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
      print('------------------------APIHELPER--------------------' +
          responseJson.toString());
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!' + responseJson.toString());
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> responseJson = json.decode(response.body);
        print('-------------------RESPONSE------------------' +
            responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 402:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
