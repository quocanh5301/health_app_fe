// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      userAge: (json['user_age'] as num?)?.toInt(),
      height: (json['user_height'] as num?)?.toInt(),
      weight: (json['user_weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'user_age': instance.userAge,
      'user_height': instance.height,
      'user_weight': instance.weight,
    };
