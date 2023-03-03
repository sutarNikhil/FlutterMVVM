import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider_demo/utils/app_exceptions.dart';
import 'package:provider_demo/utils/utils.dart';

import '../../res/constants.dart';

class NetworkService {
  static const baseUrl = "";

  static Future<dynamic> getRequest(String url) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = responseJson(response);
    } on SocketException catch (e) {
      throw FetchDataException(message: e.message);
    }
    return responseJson;
  }

  static Future<dynamic> postRequest(
      String url, Map<String, dynamic> data) async {
    dynamic responseJson;
    try {
      var response = await http.post(
        Uri.parse(Constant.login),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));
      responseJson = response;
    } on SocketException catch (e) {
      throw FetchDataException(message: e.message);
    }
    return responseJson;
  }

  dynamic responseJson(http.Response response) {
    dynamic data;
    switch (response.statusCode) {
      case 200:
        data = jsonDecode(response.body);
        return data;
      case 400:
        throw BadRequestException(message: response.body.toString());
      case 404:
        throw UnauthorizedException(message: response.body.toString());
      default:
        throw FetchDataException(message: response.body.toString());
    }
  }
}
