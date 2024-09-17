// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mvvm_sept/data/app_exceptions.dart';
import 'package:mvvm_sept/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiServices(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      //.timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
    //catch (e) {}
  }

  @override
  Future getPostApiServices(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJsons = jsonDecode(response.body.toString());
        if (kDebugMode) {
          print(responseJsons.toString());
        }
        return responseJsons;
      case 201:
        dynamic responseJsons = jsonDecode(response.body);
        return responseJsons;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 401:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accoured while communication with serverwith status code${response.statusCode}");
    }
  }
}
