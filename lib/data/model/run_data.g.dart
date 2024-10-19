// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RunDataImpl _$$RunDataImplFromJson(Map<String, dynamic> json) =>
    _$RunDataImpl(
      distanceTraveled: (json['distanceTraveled'] as num?)?.toDouble() ?? 0,
      stepsCount: (json['stepsCount'] as num?)?.toInt() ?? 0,
      timePassed: json['timePassed'] == null
          ? Duration.zero
          : Duration(microseconds: (json['timePassed'] as num).toInt()),
    );

Map<String, dynamic> _$$RunDataImplToJson(_$RunDataImpl instance) =>
    <String, dynamic>{
      'distanceTraveled': instance.distanceTraveled,
      'stepsCount': instance.stepsCount,
      'timePassed': instance.timePassed.inMicroseconds,
    };
