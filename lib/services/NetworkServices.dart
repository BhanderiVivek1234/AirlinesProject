import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:api_example/exception_handler.dart';
import 'package:api_example/model/Airlines.dart';
import 'package:api_example/services/Result.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkServices {
  // Future<Result<dynamic, Exception>> fetchAirlines(
  //     String authority, String path) async {
  //   try {
  //     http.Response response = await http.get(Uri.https(authority, path));
  //     if (response.statusCode == 200) {
  //       // Airlines airline = Airlines.fromJson(jsonDecode(response.body));
  //       return Result.success(response.body);
  //     } else {
  //       print("failed to load network url");
  //     }
  //   } catch (e) {
  //     return Result.failure(Exception("no internet is connected"));
  //   }
  //   return Result.failure(Exception());
  // }
  Future<String> fetch(String authority, String path) async {
    http.Response response = await http.get(Uri.https(authority, path));
    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }

  Future<String> fetchImage(String url) async {
    String image = "";
    try {
      http.Response imageResponse = await http.get(Uri.parse(url));
      if (imageResponse.statusCode == 200) {
        final bytes = imageResponse.bodyBytes;

        image = base64.encode(bytes);
        return image;
      } else {
        print("image parse throw error");
      }
    } catch (e) {
      print(e.toString());
      print("error throw when parsing image url");
    }
    return image;
  }
}
