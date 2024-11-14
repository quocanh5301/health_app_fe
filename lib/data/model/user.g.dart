// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      image: json['image'] as String? ?? "",
      apiKey: json['apiKey'] as String? ?? "",
      refreshApiKey: json['refreshApiKey'] as String? ?? "",
      joinAt: json['joinAt'] as String? ?? "",
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'apiKey': instance.apiKey,
      'refreshApiKey': instance.refreshApiKey,
      'joinAt': instance.joinAt,
    };
