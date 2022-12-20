import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String lastName,
    required String firstName,
    required String phone,
    required List<UserEmail> emails,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

@freezed
class UserEmail with _$UserEmail {
  factory UserEmail({
    required int id,
    required String email,
    @JsonKey(defaultValue: false, name: 'default') required bool isMain,
  }) = _UserEmail;

  factory UserEmail.fromJson(Map<String, Object?> json) =>
      _$UserEmailFromJson(json);
}
