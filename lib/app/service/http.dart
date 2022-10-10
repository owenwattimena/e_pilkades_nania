import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../config/constant.dart';
import '../model/api_return_value.dart';

import 'package:http/http.dart' as http;


class Http{
   static Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Accept" : "application/json"
  };

  static Future<ApiReturnValue> request(Future<ApiReturnValue> Function() doSomething) async {
    ApiReturnValue result;
    try {
      result = await doSomething();
    } on TimeoutException {
      result = ApiReturnValue(
        data: null,
        message: "Error. Request timeout",
        statusCode: REQUEST_TIME_OUT,
        success: false
      );
    } on SocketException {
      result = ApiReturnValue(
        data: null,
        message: "Error. SocketException",
        statusCode: INTERNET_ERROR,
        success: false
      );
    } catch (e) {
      result = ApiReturnValue(
        data: null,
        message: "Error. ${e.toString()}",
        statusCode: BAD_REQUEST,
        success: false
      );
    }
    return result;
  }

  static Future<ApiReturnValue> post(String url, Map body, {String? token}) async {
    if (token != null) {
      Http.headers["Authorization"] = "Bearer $token";
    }
    return Http.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      // print(body);

      var response = await client
          .post(
            uri,
            headers: Http.headers,
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: TIME_DURATION));
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['meta']['code'] == REQUEST_SUCCESS) {
        return ApiReturnValue(
          data: jsonResponse['data'],
          message: jsonResponse['meta']['message'],
          statusCode: jsonResponse['meta']['code'],
          success: jsonResponse['meta']['success']
        );
      } else {
        return ApiReturnValue(
          data: jsonResponse['data'],
          message: jsonResponse['meta']['message'],
          statusCode: jsonResponse['meta']['code'],
          success: jsonResponse['meta']['success']
        );
      }
    });
  }

  static Future<ApiReturnValue> get(String url, {String? token}) async {
    if (token != null) {
      Http.headers["Authorization"] = "Bearer $token";
    }
    return Http.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      var response = await client
          .get(
            uri,
            headers: Http.headers,
          )
          .timeout(const Duration(seconds: TIME_DURATION));
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['meta']['code'] == REQUEST_SUCCESS) {
        return ApiReturnValue(
          data: jsonResponse['data'],
          message: jsonResponse['meta']['message'],
          statusCode: jsonResponse['meta']['code'],
          success: jsonResponse['meta']['success']
        );
      } else {
        return ApiReturnValue(
          data: jsonResponse['data'],
          message: jsonResponse['meta']['message'],
          statusCode: jsonResponse['meta']['code'],
          success: jsonResponse['meta']['success']
        );
      }
    });
  }

  static Future<ApiReturnValue> put(String url, Map body, {String? token}) async {
    if (token != null) {
      Http.headers["Authorization"] = "Bearer $token";
    }
    return Http.request(() async {
      var uri = Uri.parse(url);
      http.Client client = http.Client();
      var response = await client
          .put(
            uri,
            headers: Http.headers,
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: TIME_DURATION));
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      if (response.statusCode == REQUEST_SUCCESS) {
        return ApiReturnValue(
          data: jsonResponse['data'],
          message: "success",
          statusCode: jsonResponse['meta']['code'],
          success: jsonResponse['meta']['success']
        );
      } else {
        return ApiReturnValue(
          data: jsonResponse['data'],
          message: "error",
          statusCode: jsonResponse['meta']['code'],
          success: jsonResponse['meta']['success']
        );
      }
    });
  }

}