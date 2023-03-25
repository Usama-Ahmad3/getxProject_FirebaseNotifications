import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_project/data/app_exception.dart';
import 'package:getx_project/data/network/base_api_url.dart';
import 'package:http/http.dart' as http;

class NetworkServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout('');
    }
    return responsejson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responsejson;
    try {
      final response = await http
          .post(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout('');
    }
    if(kDebugMode){
      print(responsejson);
    }
    return responsejson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      default:
        return FetchDataException('');
    }
  }
}
