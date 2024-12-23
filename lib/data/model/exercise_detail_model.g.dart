// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseDetailModelImpl _$$ExerciseDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseDetailModelImpl(
      id: (json['id'] as num?)?.toInt(),
      exerciseName: json['exercise_name'] as String?,
      calor: (json['calor'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      guide: json['guide'] as String?,
      difficulty: json['difficulty'] as String?,
      image: json['image'] as String?,
      muscleGroups: (json['muscle_groups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      guideImages: (json['guide_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isFavorite: json['is_favorite'] as bool?,
    );

Map<String, dynamic> _$$ExerciseDetailModelImplToJson(
        _$ExerciseDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercise_name': instance.exerciseName,
      'calor': instance.calor,
      'duration': instance.duration,
      'guide': instance.guide,
      'difficulty': instance.difficulty,
      'image': instance.image,
      'muscle_groups': instance.muscleGroups,
      'guide_images': instance.guideImages,
      'is_favorite': instance.isFavorite,
    };
