// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirlinesStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AirlinesStore on AirlineStoreBase, Store {
  late final _$uiStateAtom =
      Atom(name: 'AirlineStoreBase.uiState', context: context);

  @override
  Result get uiState {
    _$uiStateAtom.reportRead();
    return super.uiState;
  }

  @override
  set uiState(Result value) {
    _$uiStateAtom.reportWrite(value, super.uiState, () {
      super.uiState = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: 'AirlineStoreBase.errorMsg', context: context);

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$dateTimeAtom =
      Atom(name: 'AirlineStoreBase.dateTime', context: context);

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  late final _$AirlineStoreBaseActionController =
      ActionController(name: 'AirlineStoreBase', context: context);

  @override
  void loadAirline() {
    final _$actionInfo = _$AirlineStoreBaseActionController.startAction(
        name: 'AirlineStoreBase.loadAirline');
    try {
      return super.loadAirline();
    } finally {
      _$AirlineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadTime() {
    final _$actionInfo = _$AirlineStoreBaseActionController.startAction(
        name: 'AirlineStoreBase.loadTime');
    try {
      return super.loadTime();
    } finally {
      _$AirlineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkInternetConnection() {
    final _$actionInfo = _$AirlineStoreBaseActionController.startAction(
        name: 'AirlineStoreBase.checkInternetConnection');
    try {
      return super.checkInternetConnection();
    } finally {
      _$AirlineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uiState: ${uiState},
errorMsg: ${errorMsg},
dateTime: ${dateTime}
    ''';
  }
}
