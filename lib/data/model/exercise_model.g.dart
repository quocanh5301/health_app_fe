// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      calor: (json['calor'] as num?)?.toInt() ?? 0,
      time: (json['time'] as num?)?.toInt() ?? 0,
      guide: json['guide'] as String? ?? "",
      muscleGroup: json['muscleGroup'] as String? ?? "",
      difficulty: json['difficulty'] as String? ?? "",
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calor': instance.calor,
      'time': instance.time,
      'guide': instance.guide,
      'muscleGroup': instance.muscleGroup,
      'difficulty': instance.difficulty,
    };
