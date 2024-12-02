// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_heart_rate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicHeartRateDataImpl _$$BasicHeartRateDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BasicHeartRateDataImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      measuredAt: json['measured_at'] as String?,
      bpm: (json['heart_rate'] as num?)?.toInt(),
      stressLevel: (json['stress_level'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BasicHeartRateDataImplToJson(
        _$BasicHeartRateDataImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'measured_at': instance.measuredAt,
      'heart_rate': instance.bpm,
      'stress_level': instance.stressLevel,
    };
