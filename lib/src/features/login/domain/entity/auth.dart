// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const AuthEntity._();

  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) = _AuthEntity;

  bool get isExpired => expiresIn < DateTime.now().millisecondsSinceEpoch;
}
