// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseDetailModel _$ExerciseDetailModelFromJson(Map<String, dynamic> json) {
  return _ExerciseDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseDetailModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercise_name')
  String? get exerciseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'calor')
  int? get calor => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'guide')
  String? get guide => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty')
  String? get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'muscle_groups')
  List<String>? get muscleGroups => throw _privateConstructorUsedError;
  @JsonKey(name: 'guide_images')
  List<String>? get guideImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseDetailModelCopyWith<ExerciseDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDetailModelCopyWith<$Res> {
  factory $ExerciseDetailModelCopyWith(
          ExerciseDetailModel value, $Res Function(ExerciseDetailModel) then) =
      _$ExerciseDetailModelCopyWithImpl<$Res, ExerciseDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'exercise_name') String? exerciseName,
      @JsonKey(name: 'calor') int? calor,
      @JsonKey(name: 'duration') int? duration,
      @JsonKey(name: 'guide') String? guide,
      @JsonKey(name: 'difficulty') String? difficulty,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'muscle_groups') List<String>? muscleGroups,
      @JsonKey(name: 'guide_images') List<String>? guideImages,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class _$ExerciseDetailModelCopyWithImpl<$Res, $Val extends ExerciseDetailModel>
    implements $ExerciseDetailModelCopyWith<$Res> {
  _$ExerciseDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exerciseName = freezed,
    Object? calor = freezed,
    Object? duration = freezed,
    Object? guide = freezed,
    Object? difficulty = freezed,
    Object? image = freezed,
    Object? muscleGroups = freezed,
    Object? guideImages = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exerciseName: freezed == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String?,
      calor: freezed == calor
          ? _value.calor
          : calor // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      guide: freezed == guide
          ? _value.guide
          : guide // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroups: freezed == muscleGroups
          ? _value.muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      guideImages: freezed == guideImages
          ? _value.guideImages
          : guideImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseDetailModelImplCopyWith<$Res>
    implements $ExerciseDetailModelCopyWith<$Res> {
  factory _$$ExerciseDetailModelImplCopyWith(_$ExerciseDetailModelImpl value,
          $Res Function(_$ExerciseDetailModelImpl) then) =
      __$$ExerciseDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'exercise_name') String? exerciseName,
      @JsonKey(name: 'calor') int? calor,
      @JsonKey(name: 'duration') int? duration,
      @JsonKey(name: 'guide') String? guide,
      @JsonKey(name: 'difficulty') String? difficulty,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'muscle_groups') List<String>? muscleGroups,
      @JsonKey(name: 'guide_images') List<String>? guideImages,
      @JsonKey(name: 'is_favorite') bool? isFavorite});
}

/// @nodoc
class __$$ExerciseDetailModelImplCopyWithImpl<$Res>
    extends _$ExerciseDetailModelCopyWithImpl<$Res, _$ExerciseDetailModelImpl>
    implements _$$ExerciseDetailModelImplCopyWith<$Res> {
  __$$ExerciseDetailModelImplCopyWithImpl(_$ExerciseDetailModelImpl _value,
      $Res Function(_$ExerciseDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exerciseName = freezed,
    Object? calor = freezed,
    Object? duration = freezed,
    Object? guide = freezed,
    Object? difficulty = freezed,
    Object? image = freezed,
    Object? muscleGroups = freezed,
    Object? guideImages = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_$ExerciseDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exerciseName: freezed == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String?,
      calor: freezed == calor
          ? _value.calor
          : calor // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      guide: freezed == guide
          ? _value.guide
          : guide // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroups: freezed == muscleGroups
          ? _value._muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      guideImages: freezed == guideImages
          ? _value._guideImages
          : guideImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseDetailModelImpl implements _ExerciseDetailModel {
  const _$ExerciseDetailModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'exercise_name') this.exerciseName,
      @JsonKey(name: 'calor') this.calor,
      @JsonKey(name: 'duration') this.duration,
      @JsonKey(name: 'guide') this.guide,
      @JsonKey(name: 'difficulty') this.difficulty,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'muscle_groups') final List<String>? muscleGroups,
      @JsonKey(name: 'guide_images') final List<String>? guideImages,
      @JsonKey(name: 'is_favorite') this.isFavorite})
      : _muscleGroups = muscleGroups,
        _guideImages = guideImages;

  factory _$ExerciseDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'exercise_name')
  final String? exerciseName;
  @override
  @JsonKey(name: 'calor')
  final int? calor;
  @override
  @JsonKey(name: 'duration')
  final int? duration;
  @override
  @JsonKey(name: 'guide')
  final String? guide;
  @override
  @JsonKey(name: 'difficulty')
  final String? difficulty;
  @override
  @JsonKey(name: 'image')
  final String? image;
  final List<String>? _muscleGroups;
  @override
  @JsonKey(name: 'muscle_groups')
  List<String>? get muscleGroups {
    final value = _muscleGroups;
    if (value == null) return null;
    if (_muscleGroups is EqualUnmodifiableListView) return _muscleGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _guideImages;
  @override
  @JsonKey(name: 'guide_images')
  List<String>? get guideImages {
    final value = _guideImages;
    if (value == null) return null;
    if (_guideImages is EqualUnmodifiableListView) return _guideImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  @override
  String toString() {
    return 'ExerciseDetailModel(id: $id, exerciseName: $exerciseName, calor: $calor, duration: $duration, guide: $guide, difficulty: $difficulty, image: $image, muscleGroups: $muscleGroups, guideImages: $guideImages, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.calor, calor) || other.calor == calor) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.guide, guide) || other.guide == guide) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._muscleGroups, _muscleGroups) &&
            const DeepCollectionEquality()
                .equals(other._guideImages, _guideImages) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      exerciseName,
      calor,
      duration,
      guide,
      difficulty,
      image,
      const DeepCollectionEquality().hash(_muscleGroups),
      const DeepCollectionEquality().hash(_guideImages),
      isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseDetailModelImplCopyWith<_$ExerciseDetailModelImpl> get copyWith =>
      __$$ExerciseDetailModelImplCopyWithImpl<_$ExerciseDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseDetailModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseDetailModel implements ExerciseDetailModel {
  const factory _ExerciseDetailModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'exercise_name') final String? exerciseName,
          @JsonKey(name: 'calor') final int? calor,
          @JsonKey(name: 'duration') final int? duration,
          @JsonKey(name: 'guide') final String? guide,
          @JsonKey(name: 'difficulty') final String? difficulty,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'muscle_groups') final List<String>? muscleGroups,
          @JsonKey(name: 'guide_images') final List<String>? guideImages,
          @JsonKey(name: 'is_favorite') final bool? isFavorite}) =
      _$ExerciseDetailModelImpl;

  factory _ExerciseDetailModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'exercise_name')
  String? get exerciseName;
  @override
  @JsonKey(name: 'calor')
  int? get calor;
  @override
  @JsonKey(name: 'duration')
  int? get duration;
  @override
  @JsonKey(name: 'guide')
  String? get guide;
  @override
  @JsonKey(name: 'difficulty')
  String? get difficulty;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'muscle_groups')
  List<String>? get muscleGroups;
  @override
  @JsonKey(name: 'guide_images')
  List<String>? get guideImages;
  @override
  @JsonKey(name: 'is_favorite')
  bool? get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseDetailModelImplCopyWith<_$ExerciseDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
