import 'package:freezed_annotation/freezed_annotation.dart';
import 'http_error.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.ok(T data) = Ok;
  const factory Result.error(Exception error) = Error;
}