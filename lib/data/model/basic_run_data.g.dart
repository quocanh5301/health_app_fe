// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_run_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicRunDataImpl _$$BasicRunDataImplFromJson(Map<String, dynamic> json) =>
    _$BasicRunDataImpl(
      date: json['run_date'] as String?,
      distance: json['total_distance'] as String?,
      steps: (json['total_steps'] as num?)?.toInt(),
      duration: (json['total_duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BasicRunDataImplToJson(_$BasicRunDataImpl instance) =>
    <String, dynamic>{
      'run_date': instance.date,
      'total_distance': instance.distance,
      'total_steps': instance.steps,
      'total_duration': instance.duration,
    };
