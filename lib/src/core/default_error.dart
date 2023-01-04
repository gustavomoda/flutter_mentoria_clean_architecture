// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'default_error.freezed.dart';

@freezed
class DefaultError with _$DefaultError {
  const factory DefaultError.info({
    required String title,
    required String message,
  }) = _Info;

  const factory DefaultError.warning({
    required String title,
    required String message,
    required Exception? cause,
  }) = _Warning;

  const factory DefaultError.fatal({
    required String title,
    required String message,
    required Exception? cause,
  }) = _Fatal;
}
