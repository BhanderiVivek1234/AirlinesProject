import 'package:freezed_annotation/freezed_annotation.dart';

part 'Result.freezed.dart';

enum ResultsStatus { success, failure }

@freezed
class Result with _$Result {
  const Result._();
  factory Result.success(
      {value, @Default(ResultsStatus.success) ResultsStatus status}) = Success;

  factory Result.failure(
      {error, @Default(ResultsStatus.failure) ResultsStatus status}) = Failure;

  factory Result.initial() = Initial;

  factory Result.loading() = Loading;

  // factory Result.loading()=Loading();
}

// const factory Result(
//     {required value,
//     required error,
//     required ResultsStatus status}) = _Result;

// final T? value;
// final E? error;
// final ResultsStatus status;

// Result({required this.value, required this.error, required this.status});

// const factory Result({required T value, E error, ResultsStatus status}) =
//     _Result;

// Result.success(this.value)
//     : status = ResultsStatus.success,
//       error = null;

// Result.failure(this.error)
//     : status = ResultsStatus.failure,
//       value = null;
