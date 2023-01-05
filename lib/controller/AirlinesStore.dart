import 'dart:convert';

import 'package:api_example/exception_handler.dart';
import 'package:api_example/model/Airlines.dart';
import 'package:api_example/repository/Repository.dart';
import 'package:api_example/services/Result.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';
part 'AirlinesStore.g.dart';

class AirlinesStore = AirlineStoreBase with _$AirlinesStore;

abstract class AirlineStoreBase with Store {
  AirlineStoreBase() {
    checkInternetConnection();
    loadAirline();
  }
  final AirlinesRepository _repository = AirlinesRepository();

  @observable
  Result uiState = Initial();

  @observable
  String errorMsg = "";

  @observable
  DateTime dateTime = DateTime.now();

  @action
  void loadAirline() {
    uiState = Loading();
    _repository.fetchAirlines().then((value) async {
      var company = Airlines.fromJson(jsonDecode(value));
      company.logo = await _repository.fetchImage(company.logo!);
      _repository.storeAirlines(company, 1);
      _repository.storeTime();
      uiState = Success(value: company);
    }).onError(
      (error, stackTrace) {
        var errData = ExceptionHandlers().getExceptionString(error);
        errorMsg = errData;
        uiState = Failure(error: errData);
        try {
          var data = _repository.fetchAirlinesFromStorage();
          uiState = Success(value: data);
        } catch (e) {
          var errData = ExceptionHandlers().getExceptionString(error);
          errorMsg = errData;
          uiState = Failure(error: errData);
        }
      },
    );
    // _repository.fetchAirlines().then((value) {
    //   uiState = value;
    //   value.map(
    //     failure: (value) {
    //       errorMsg = value.error;
    //       var data = _repository.fetchAirlinesFromStorage();
    //       data?.map(
    //         success: (data) {
    //           airlines.add(data.value);
    //           airlines = airlines;
    //         },
    //         failure: (data) {
    //           errorMsg = data.error;
    //         },
    //       );
    //     },
    //     success: (value) {
    //       airlines.add(value.value);

    //       airlines = airlines;
    // _repository.storeAirlines(
    //     Airlines(
    //         name: value.value.name,
    //         country: value.value.country,
    //         logo: value.value.logo),
    //     1);
    // _repository.storeTime();
    //     },
    //   );

    // print(value.status);
    // switch (value.status) {
    //   case ResultsStatus.success:
    // airlines.add(value.value);

    // airlines = airlines;
    // _repository.storeAirlines(
    //     Airlines(
    //         value.value.name, value.value.country, value.value.logo),
    //     1);
    // _repository.storeTime();
    //   break;
    // case ResultsStatus.failure:
    // errorMsg = value.error;
    // var data = _repository.fetchAirlinesFromStorage();
    // switch (data!.status) {
    // case ResultsStatus.success:
    // airlines.add(data.value);
    // airlines = airlines;

    // break;
    // case ResultsStatus.failure:
    // errorMsg = data.error;
    // break;
    // default:
    // }
    // break;
    // default:
    // }
    // });
    loadTime();
  }

  @action
  void loadTime() {
    dateTime = (_repository.getLastUpdatedTime())!;
  }

  @action
  void checkInternetConnection() {
    InternetConnectionChecker().onStatusChange.listen(
      (status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            print('Data connection is available.');
            break;
          case InternetConnectionStatus.disconnected:
            print('You are disconnected from the internet.');
            errorMsg = "No Internet Connection is available";
            break;
        }
      },
    );
  }
}
