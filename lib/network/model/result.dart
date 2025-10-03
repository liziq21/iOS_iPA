import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class Result<T> with _$Result<T> {
  const factory Result(
    int code,
    String message,
    int ttl,
    T? data,
  ) = _Result<T>;
  
  //const factory Result.success(T data) = Success<T>;

  //const factory Result.failure(String message) = Failure<T>;
  
  factory Result.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
    _$ResultFromJson(json, fromJsonT);
}