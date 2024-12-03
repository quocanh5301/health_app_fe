// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_email') String? userEmail,
    @JsonKey(name: 'user_age') int? userAge,
    @JsonKey(name: 'user_height') int? height,
    @JsonKey(name: 'user_weight') int? weight,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
