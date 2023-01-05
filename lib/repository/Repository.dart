import 'dart:convert';
import 'dart:io';

import 'package:api_example/TimeStorage.dart';
import 'package:api_example/exception_handler.dart';
import 'package:api_example/model/Airlines.dart';
import 'package:api_example/services/NetworkServices.dart';
import 'package:api_example/services/Result.dart';
import 'package:api_example/services/StorageServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AirlinesRepository {
  final NetworkServices _networkServices = NetworkServices();
  final StorageServices _storageServices = StorageServices();
  final mainUrl = "api.instantwebtools.net";
  var path = '/v1/airlines/';

  // Future<List> getAirlines() async {
  //   var tempList = [];
  //   for (var i = 1; i < 11; i++) {
  //     await _networkServices
  //         .fetchAirlines(mainUrl, path + "$i")
  //         .then((result) async {
  //       switch (result.status) {
  //         case ResultsStatus.success:
  //           var time = TimeStorage(DateTime.now());
  //           await _storageServices.storeTime(time, "lastUpdatedTime");
  //           Airlines airline = Airlines.fromJson(jsonDecode(result.value));

  //           airline.logo = await _networkServices.fetchImage(airline.logo!);
  //           Airlines company = Airlines(
  //               airline.name!, airline.country ?? "", airline.logo!);

  //           tempList.add(airline);
  //           await _storageServices.storeAirline(company, i);
  //           break;
  //         case ResultsStatus.failure:
  //           tempList.add(await _storageServices.getAirline(i));

  //           break;
  //         default:
  //       }
  //     });
  //   }
  //   return tempList;
  // }

  // Future<Result> fetchAirlines() async {
  //   late Result result;
  //   await _networkServices.fetch(mainUrl, path + "2").then((value) async {
  //     print(value);
  // var company = Airlines.fromJson(jsonDecode(value));
  // company.logo = await _networkServices.fetchImage(company.logo!);
  // result = Success(value: company);
  //   }).onError((error, stackTrace) {
  // var errData = ExceptionHandlers().getExceptionString(error);
  //     print("Error handeler class error is$errData");

  //     result = Failure(error: errData);
  //   });
  //   return result;
  // }
  Future fetchAirlines() {
    return _networkServices.fetch(mainUrl, path + "2");
  }

  Future<String> fetchImage(String url) {
    return _networkServices.fetchImage(url);
  }

  Airlines? fetchAirlinesFromStorage() {
    var data = _storageServices.getAirline(2);
    return data;
  }

  void storeAirlines(Airlines data, int key) {
    _storageServices.storeAirline(data, key);
  }

  void storeTime() {
    _storageServices.storeTime(TimeStorage(DateTime.now()), "lastUpdatedTime");
  }

  DateTime? getLastUpdatedTime() {
    return _storageServices.getTime("lastUpdatedTime");
  }
}
