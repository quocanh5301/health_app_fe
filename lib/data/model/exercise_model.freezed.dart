// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return _ExerciseModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseModel {
  @JsonKey(name: 'exercise_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercise_name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'calor')
  int? get calor => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty')
  String? get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'muscle_groups')
  List<String>? get muscleGroups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseModelCopyWith<ExerciseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseModelCopyWith<$Res> {
  factory $ExerciseModelCopyWith(
          ExerciseModel value, $Res Function(ExerciseModel) then) =
      _$ExerciseModelCopyWithImpl<$Res, ExerciseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'exercise_id') int? id,
      @JsonKey(name: 'exercise_name') String? name,
      @JsonKey(name: 'calor') int? calor,
      @JsonKey(name: 'duration') int? duration,
      @JsonKey(name: 'difficulty') String? difficulty,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'muscle_groups') List<String>? muscleGroups});
}

/// @nodoc
class _$ExerciseModelCopyWithImpl<$Res, $Val extends ExerciseModel>
    implements $ExerciseModelCopyWith<$Res> {
  _$ExerciseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? calor = freezed,
    Object? duration = freezed,
    Object? difficulty = freezed,
    Object? image = freezed,
    Object? muscleGroups = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      calor: freezed == calor
          ? _value.calor
          : calor // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseModelImplCopyWith<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  factory _$$ExerciseModelImplCopyWith(
          _$ExerciseModelImpl value, $Res Function(_$ExerciseModelImpl) then) =
      __$$ExerciseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'exercise_id') int? id,
      @JsonKey(name: 'exercise_name') String? name,
      @JsonKey(name: 'calor') int? calor,
      @JsonKey(name: 'duration') int? duration,
      @JsonKey(name: 'difficulty') String? difficulty,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'muscle_groups') List<String>? muscleGroups});
}

/// @nodoc
class __$$ExerciseModelImplCopyWithImpl<$Res>
    extends _$ExerciseModelCopyWithImpl<$Res, _$ExerciseModelImpl>
    implements _$$ExerciseModelImplCopyWith<$Res> {
  __$$ExerciseModelImplCopyWithImpl(
      _$ExerciseModelImpl _value, $Res Function(_$ExerciseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? calor = freezed,
    Object? duration = freezed,
    Object? difficulty = freezed,
    Object? image = freezed,
    Object? muscleGroups = freezed,
  }) {
    return _then(_$ExerciseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      calor: freezed == calor
          ? _value.calor
          : calor // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModelImpl implements _ExerciseModel {
  const _$ExerciseModelImpl(
      {@JsonKey(name: 'exercise_id') this.id,
      @JsonKey(name: 'exercise_name') this.name,
      @JsonKey(name: 'calor') this.calor,
      @JsonKey(name: 'duration') this.duration,
      @JsonKey(name: 'difficulty') this.difficulty,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'muscle_groups') final List<String>? muscleGroups})
      : _muscleGroups = muscleGroups;

  factory _$ExerciseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModelImplFromJson(json);

  @override
  @JsonKey(name: 'exercise_id')
  final int? id;
  @override
  @JsonKey(name: 'exercise_name')
  final String? name;
  @override
  @JsonKey(name: 'calor')
  final int? calor;
  @override
  @JsonKey(name: 'duration')
  final int? duration;
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

  @override
  String toString() {
    return 'ExerciseModel(id: $id, name: $name, calor: $calor, duration: $duration, difficulty: $difficulty, image: $image, muscleGroups: $muscleGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.calor, calor) || other.calor == calor) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._muscleGroups, _muscleGroups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, calor, duration,
      difficulty, image, const DeepCollectionEquality().hash(_muscleGroups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      __$$ExerciseModelImplCopyWithImpl<_$ExerciseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseModel implements ExerciseModel {
  const factory _ExerciseModel(
          {@JsonKey(name: 'exercise_id') final int? id,
          @JsonKey(name: 'exercise_name') final String? name,
          @JsonKey(name: 'calor') final int? calor,
          @JsonKey(name: 'duration') final int? duration,
          @JsonKey(name: 'difficulty') final String? difficulty,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'muscle_groups') final List<String>? muscleGroups}) =
      _$ExerciseModelImpl;

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseModelImpl.fromJson;

  @override
  @JsonKey(name: 'exercise_id')
  int? get id;
  @override
  @JsonKey(name: 'exercise_name')
  String? get name;
  @override
  @JsonKey(name: 'calor')
  int? get calor;
  @override
  @JsonKey(name: 'duration')
  int? get duration;
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
  @JsonKey(ignore: true)
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
