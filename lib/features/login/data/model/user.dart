import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    required List<UserEmail> emails,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class UserEmail with _$UserEmail {
  factory UserEmail({
    required String id,
    required String email,
    @JsonKey(defaultValue: false, name: 'default') required bool isMain,
  }) = _UserEmail;

  factory UserEmail.fromJson(Map<String, Object?> json) =>
      _$UserEmailFromJson(json);
}
