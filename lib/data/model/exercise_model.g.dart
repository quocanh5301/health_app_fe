// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      id: (json['exercise_id'] as num?)?.toInt(),
      name: json['exercise_name'] as String?,
      calor: (json['calor'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      difficulty: json['difficulty'] as String?,
      image: json['image'] as String?,
      muscleGroups: (json['muscle_groups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      'exercise_id': instance.id,
      'exercise_name': instance.name,
      'calor': instance.calor,
      'duration': instance.duration,
      'difficulty': instance.difficulty,
      'image': instance.image,
      'muscle_groups': instance.muscleGroups,
    };
