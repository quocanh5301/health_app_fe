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
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get calor => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  String get guide => throw _privateConstructorUsedError;
  String get muscleGroup =>
      throw _privateConstructorUsedError; //Chest, Upper Back, Lower Back, Shoulder, Biceps, Triceps, Forearms, Thighs, Calves, Core, Glutes, Full Body
  String get difficulty => throw _privateConstructorUsedError;

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
      {int id,
      String name,
      int calor,
      int time,
      String guide,
      String muscleGroup,
      String difficulty});
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
    Object? id = null,
    Object? name = null,
    Object? calor = null,
    Object? time = null,
    Object? guide = null,
    Object? muscleGroup = null,
    Object? difficulty = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      calor: null == calor
          ? _value.calor
          : calor // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      guide: null == guide
          ? _value.guide
          : guide // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
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
      {int id,
      String name,
      int calor,
      int time,
      String guide,
      String muscleGroup,
      String difficulty});
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
    Object? id = null,
    Object? name = null,
    Object? calor = null,
    Object? time = null,
    Object? guide = null,
    Object? muscleGroup = null,
    Object? difficulty = null,
  }) {
    return _then(_$ExerciseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      calor: null == calor
          ? _value.calor
          : calor // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      guide: null == guide
          ? _value.guide
          : guide // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModelImpl implements _ExerciseModel {
  const _$ExerciseModelImpl(
      {this.id = 0,
      this.name = "",
      this.calor = 0,
      this.time = 0,
      this.guide = "",
      this.muscleGroup = "",
      this.difficulty = ""});

  factory _$ExerciseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int calor;
  @override
  @JsonKey()
  final int time;
  @override
  @JsonKey()
  final String guide;
  @override
  @JsonKey()
  final String muscleGroup;
//Chest, Upper Back, Lower Back, Shoulder, Biceps, Triceps, Forearms, Thighs, Calves, Core, Glutes, Full Body
  @override
  @JsonKey()
  final String difficulty;

  @override
  String toString() {
    return 'ExerciseModel(id: $id, name: $name, calor: $calor, time: $time, guide: $guide, muscleGroup: $muscleGroup, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.calor, calor) || other.calor == calor) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.guide, guide) || other.guide == guide) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, calor, time, guide, muscleGroup, difficulty);

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
      {final int id,
      final String name,
      final int calor,
      final int time,
      final String guide,
      final String muscleGroup,
      final String difficulty}) = _$ExerciseModelImpl;

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get calor;
  @override
  int get time;
  @override
  String get guide;
  @override
  String get muscleGroup;
  @override //Chest, Upper Back, Lower Back, Shoulder, Biceps, Triceps, Forearms, Thighs, Calves, Core, Glutes, Full Body
  String get difficulty;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
